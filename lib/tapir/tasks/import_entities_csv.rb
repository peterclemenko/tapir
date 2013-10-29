

def name
  "import_entities_csv"
end

def pretty_name
  "Import Entities CSV"
end

## Returns a string which describes what this task does
def description
  "This is a task to import entities from a csv."
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [ Entities::ParsableFile,
    Entities::ParsableText ]
end

## Returns an array of valid options and their description/type for this task
def allowed_options
 []
end

def setup(entity, options={})
  super(entity, options)
end

## Default method, subclasses must override this
def run
  super

  if @entity.kind_of? Entities::ParsableText
    text = @entity.text
  else #ParsableFile
    text = open(@entity.uri).read
  end

  # 
  # This task allows you to import a file with the following format: 
  # Entities::EmailAddress, "{name : "test@tapirrecon.com" }"
  # Entities::EmailAddress, "{name : "blah@tapirrecon.com" }"
  # Entities::EmailAddress, "{name : "more@tapirrecon.com" }"
  #
  # The format is a string type followed by a json hash of fields. One
  # entity per line. 
  #
  
  # For each line in the file, create an entity
  text.each_line do |line|
    type_string, fields = line.split(",")

    begin
      field_hash = JSON.load(fields)

      # Let's sanity check the type first. 
      next unless Entities::Base.descendants.map{|x| x.to_s}.include?(type_string)

      # Okay, we know its a valid type, so go ahead and eval it. 
      type = eval(type_string)

      # Create the entity
      create_entity type, field_hash

    rescue Exception => e
      @task_logger.error "Encountered exception #{e}"
      @task_logger.error "Unable to create entity: #{type}, #{fields}"
      
    end

  end

end

def cleanup
  super
end
