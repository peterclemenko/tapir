
module Entities
  class NetBlock < Base
    include TenantAndProjectScoped

    field :start_address, type: String 
    field :end_address, type: String 
    field :cidr, type: String
    field :block_type, type: String
    field :description, type: String
    field :handle, type: String
    field :org_ref, type: String
    field :parent_ref, type: String

    def range
      "#{start_address}/#{cidr}"
    end

  end
end