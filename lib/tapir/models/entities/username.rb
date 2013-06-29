module Tapir
  module Entities
    class Username < Base
      include TenantAndProjectScoped

      belongs_to :person

    end
  end
end