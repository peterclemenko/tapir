module Tapir
  module Entities
    class WebApplication < Base
      include TenantAndProjectScoped

      field :description, type: String
      
      belongs_to :netsvc, :class_name => "Tapir::Entities::NetSvc"
      belongs_to :host

    end
  end
end