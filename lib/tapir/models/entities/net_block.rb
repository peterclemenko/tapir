module Tapir
  module Entities
    class NetBlock < Base
      include TenantAndProjectScoped

      field :range, type: String 
      field :handle, type: String
      field :description, type: String
      
      def to_s
        super << " #{range}"
      end
    end
  end
end