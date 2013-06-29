def name
  "usernames_guess"
end

def pretty_name
  "Usernames Guess"
end

## Returns a string which describes what this task does
def description
  "This task can be used to guess usernames, given a user."
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [Tapir::Entities::Person]
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

  # TODO - check for dictionary terms?

  ##
  ## John Effing Doe
  ##

  #johndoe
  create_entity Tapir::Entities::Username, {:person => @entity, :name => "#{@entity.first_name}.#{@entity.last_name}"}
  
  # john.doe
  create_entity Tapir::Entities::Username, {:person => @entity, :name => "#{@entity.first_name}.#{@entity.last_name}"}

  # john_doe 
  create_entity Tapir::Entities::Username, {:person => @entity, :name => "#{@entity.first_name}_#{@entity.last_name}"}
  
  # jdoe
  create_entity Tapir::Entities::Username, {:person => @entity, :name => "#{@entity.first_name.split("").first}#{@entity.last_name}"}

  # doe
  create_entity Tapir::Entities::Username, {:person => @entity, :name => "#{@entity.last_name}"}
  
  if @entity.middle_name
    #johneffingdoe
    create_entity Tapir::Entities::Username, {:person => @entity, :name => "#{@entity.first_name}#{@entity.middle_name}#{@entity.last_name}"}

    #jedoe
    create_entity Tapir::Entities::Username, {:person => @entity, :name => "#{@entity.first_name.split("").first}#{@entity.middle_name.split("").first}#{@entity.last_name}"}
  end


end
  
def cleanup
  super
end
