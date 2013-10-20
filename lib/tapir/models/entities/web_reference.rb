module Entities
  class WebReference < Base
    include TenantAndProjectScoped

    field :uri, type: String
    field :domain, type: String
    field :category, type: String
    field :content, type: String
    field :source, type: String
    field :sponsored, type: String

  end
end
