module Entities
  class WebApplication < Base
    include TenantAndProjectScoped

    field :description, type: String
    
    belongs_to :netsvc, :class_name => "Entities::NetSvc"
    belongs_to :host, :class_name => "Entities::Host"

  end
end