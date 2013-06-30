module Tapir
  module Entities
    class Host < Base
      include TenantAndProjectScoped

      field :ip_address, type: String
      
      has_many :net_svcs
      has_many :domains

      validates_uniqueness_of :ip_address, :scope => [:tenant_id,:project_id]

      #
      # This method is highly questionable, but folks generally refer to a host
      # by its ip address(es), and thus, this makes tasks easier to code.
      #
      def name
        ip_address
      end

    end
  end
end