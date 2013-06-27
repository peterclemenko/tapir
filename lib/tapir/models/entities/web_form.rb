module Tapir
  module Entities
    class WebForm < Base
      include TenantAndProjectScoped

      field :url, type: String
      field :action, type: String
      field :fields, type: String

    end
  end
end