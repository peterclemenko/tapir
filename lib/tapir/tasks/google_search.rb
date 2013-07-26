# Returns the name of this task.
def name
  "google_search"
end

def pretty_name
  "Google Search"
end

# Returns a string which describes this task.
def description
  "This task hits the Google API and finds related content. Discovered domains are created."
end

# Returns an array of valid types for this task
def allowed_types
  [ Entities::SearchString, 
    Entities::Organization, 
    Entities::Domain, 
    Entities::Host,
    Entities::Person, 
    Entities::Username, 
    Entities::Account]
end

def setup(entity, options={})
  super(entity, options)
  self
end

# Default method, subclasses must override this
def run
  super

  # Attach to the google service & search
  results = Client::Google::SearchService.new.search(@entity.name)

  results.each do |result|
    create_entity Entities::Domain, :name => result[:visible_url]
    create_entity Entities::SearchResult, {
      :name => result[:title_no_formatting],
      :url => result[:unescaped_url],
      :content => result[:content]
    }
  end

end

def cleanup
  super
end
