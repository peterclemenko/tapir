module Tapir
  module Entities
    class NetSvc < Base
      include TenantAndProjectScoped

      field :fingerprint, type: String
      field :proto, type: String
      field :port_num, type: Integer

      belongs_to :host
    end
  end
end