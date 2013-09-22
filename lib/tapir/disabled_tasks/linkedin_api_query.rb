def name
  "linkedin_api_query"
end

def pretty_name
  "Query Linkedin for a given account"
end

# Returns a string which describes what this task does
def description
  "This task grabs information from Linkedin for a given acount."
end

# Returns an array of types that are allowed to call this task
def allowed_types
  [Entities::LinkedinAccount]
end

## Returns an array of valid options and their description/type for this task
def allowed_options
 []
end

def setup(entity, options={})
  super(entity, options)
end

# Default method, subclasses must override this
def run
  super

  linkedin_search = Client::LinkedIn::SearchService.new
  details = linkedin_search.query(@entity.name, :person)
  @task_logger.log "Got result: #{details.inspect.to_s.html_safe}"

  #create_entity(Entities::DnsRecord, {:name => "#{details['url']}"})
end

def cleanup
  super
end
