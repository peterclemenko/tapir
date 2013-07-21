module Tapir
  module Entities
    class EmailAddress < Base
      include TenantAndProjectScoped

      belongs_to :person
    end
  end
end
