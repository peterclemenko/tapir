module Tapir
  module Entities
    class Note < Base
      include TenantAndProjectScoped

      field :description, type: String

    end
  end
end