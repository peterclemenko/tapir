module Tapir
  module Entities
    class Username < Base
      include TenantAndProjectScoped

    end
  end
end