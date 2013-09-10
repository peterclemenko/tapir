
module Entities
  class SearchResult < Base
    include TenantAndProjectScoped

    field :url, type: String
    field :content, type: String 
     
  end
end