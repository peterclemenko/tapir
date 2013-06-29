require 'open-uri'

def name
  "import_leadlander_list"
end

def pretty_name
  "Import Leadlander list"
end

## Returns a string which describes what this task does
def description
  "This is a task to import Leadlander information."
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [Tapir::Entities::ParsableFile]
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

  # Read the file
  list = open(@entity.uri).readlines
  
  list.each do |line|
    split_name = line.split(" ")
    split_name.shift
    org_name = split_name.join(" ")
    org = create_entity(Tapir::Entities::Organization, {:name => org_name }) if org_name
  end 
  
end

def cleanup
  super
end
