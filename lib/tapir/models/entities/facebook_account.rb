module Tapir
  module Entities
    class FacebookAccount < Base 
      include TenantAndProjectScoped
    end
  end
end