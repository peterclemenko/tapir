module Tapir
  module Entities
    class WebApplication < Base
      include TenantAndProjectScoped

      field :uri, type: String
      field :fingerprint, type: String
      field :description, type: String

    end
  end
end