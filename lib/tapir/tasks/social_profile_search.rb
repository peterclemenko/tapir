def name
  "social_profile_search"
end

def pretty_name
  "Social Profile Search"
end

## Returns a string which describes what this task does
def description
  "This task searches for common social media profiles"
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [ Entities::Username ]
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
  
  #
  # Store the account name, depending on the entity we passed in.
  #
  usernames = [@entity.name]

  #
  # Iterate through all account names!
  #
  usernames.each do |username|

    @task_logger.log "Looking for account name: #{username.name}"
    
    ###
    ### Loop through services, creating a client & checking
    ###
    ["Facebook", "FourSquare", "LinkedIn", "Google", "Myspace", 
    "SoundCloud", "TwitPic", "Twitter",  "YFrog" ].each do |client_name|
      
      #
      # Create a client of the current type
      # 
      client = eval("Client::#{client_name}::WebClient.new")
      if client.check_account_exists(username.name)
        @task_logger.log "Found an account at: #{client.check_account_uri_for(username.name)}"
        
        #
        # Create an account w/ the correct parameters
        #
        obj = create_entity Entities::Account, 
        :account_name => username.name, 
        :service_name => client.service_name, 
        :check_uri => client.check_account_uri_for(username.name),
        :web_uri => client.web_account_uri_for(username.name)
        
      else 
        @task_logger.log "No #{client.service_name} account found at: #{client.check_account_uri_for(username.name)}"
      end
    end
    
  end
end

def cleanup
  super
end
