module Tapir
  module Entities
    class TwitterAccount < Base
      include TenantAndProjectScoped

    end
  end
end