# Returns the name of this task.
def name
  "goofile_doc"
end

def pretty_name
  "Goofile DOC"
end

# Returns a string which describes this task.
def description
  "This task hits Google and finds DOC files for a given domain."
end

# Returns an array of valid types for this task
def allowed_types
  [ 
    Entities::DnsRecord
  ]
end

def setup(entity, options={})
  super(entity, options)
  self
end

# Default method, subclasses must override this
def run
  super

  # Attach to the google service & search
  results = Client::Google::SearchScraper.new.search("filetype:doc site:#{@entity.name}")

  results.each do |result|
    create_entity Entities::DocFile, :name => result
  end

end

def cleanup
  super
end
