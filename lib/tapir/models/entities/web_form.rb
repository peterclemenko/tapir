module Tapir
  module Entities
    class WebForm < Base
      include TenantAndProjectScoped

      field :uri, type: String
      field :action, type: String
      field :fields, type: String

      belongs_to :web_application

    end
  end
end