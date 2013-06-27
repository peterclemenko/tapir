module Tapir
  module Entities
    class ParsableFile < Base
      
      include TenantAndProjectScoped

      field :path, type: String
      field :type, type: String

    end
  end
end