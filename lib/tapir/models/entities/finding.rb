module Tapir
  module Entities
    class Finding < Base
      include TenantAndProjectScoped

      field :content, type: String
      field :details, type: String

      validates_uniqueness_of :content
    end
  end
end