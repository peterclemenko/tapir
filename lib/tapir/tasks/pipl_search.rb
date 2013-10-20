#module Task
#module PiplApi

def name
  "pipl_search"
end

def pretty_name
  "Search the Pipl database"
end

def description
  "Uses the Pipl API to search for information"
end

def allowed_types
  [ Entities::Account,
    Entities::Username, 
    Entities::FacebookAccount, 
    Entities::KloutAccount,
    Entities::LinkedinAccount,
    Entities::TwitterAccount,
    Entities::FacebookAccount, 
    Entities::EmailAddress, 
    Entities::PhoneNumber ]
end

def setup(entity, options={})
  super(entity, options)
  @pipl_client = Client::Pipl::ApiClient.new
end

def run
  super

  if @entity.class == Entities::EmailAddress
    response = @pipl_client.search :email, @entity.name
  elsif @entity.class == Entities::PhoneNumber
    response = @pipl_client.search :phone, @entity.name
  elsif [ Entities::Account,
          Entities::Username,
          Entities::FacebookAccount,
          Entities::TwitterAccount, 
          Entities::LinkedinAccount,
          Entities::KloutAccount ].include? @entity.class
    response = @pipl_client.search :username, @entity.name
  else 
    raise "Unknown Entity Type"
  end 

  # We need to make sure that we got a response
  # because pipl will just send us a false if we get
  # the key wrong (ie, the api key hasn't been configured)
  unless response
    @task_logger.error "Got no response from Pipl. Are you sure you've configured the key?"
    return 
  end

  if response['records']
    # Parse up the response records
    response['records'].each do |record|
      @task_logger.log "Record: #{record.to_s}\n"
      
      create_entity Entities::WebReference, { 
        :confidence => record['@query_person_match'],
        :uri => record['source']['url'],
        :domain => record['source']['domain'],
        :name => record['source']['name'],
        :category => record['source']['category'],
        :content => record['content'] ? record['content'].map{|x| x.to_s.join(" ")} : "" ,
        :source => "pipl record" }

      if record['usernames']
        record['usernames'].each do |username|
          create_entity Entities::Username, {:name => username['content'].downcase }
        end
      end
    end
  end

  if response['person']['sources']
    # Parse up the response sources
    response['person']['sources'].each do |source| 
      
      create_entity Entities::WebReference, { 
        :sponsored => source['@is_sponsored'],
        :uri => source['url'],
        :domain => source['domain'],
        :name => source['name'],
        :category => source['category'],
        :source => "pipl source" }

      @task_logger.log "Source: #{source}\n"
    end
  end

end

def cleanup
  super
end

#end
#end