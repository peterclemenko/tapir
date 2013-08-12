
module Entities
  class Host < Base
    include TenantAndProjectScoped

    has_many :net_svcs
    has_many :dns_records
    
  end
end