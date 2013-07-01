module Tapir
  module Entities
    class DocFile < Base
      include TenantAndProjectScoped
    end
  end
end