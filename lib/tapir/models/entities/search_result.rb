
module Entities
  class SearchResult < Base
    include TenantAndProjectScoped

    field :link, type: String
    field :url, type: String
    field :content, type: String 
     
  end
end