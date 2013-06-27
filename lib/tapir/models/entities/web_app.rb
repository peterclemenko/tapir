module Tapir
  module Entities
    class WebApp < Base
      include TenantAndProjectScoped

      field :url, type: String
      field :fingerprint, type: String
      field :description, type: String
      field :technology, type: String

    end
  end
end