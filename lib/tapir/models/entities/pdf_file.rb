module Tapir
  module Entities
    class PdfFile < Base
      include TenantAndProjectScoped
    end
  end
end