module TenantScoped
  
  extend ActiveSupport::Concern

  included do

    belongs_to :tenant
    before_validation { self.tenant = Tapir::Tenant.current }

    default_scope(lambda { {:where => {:tenant_id => Tapir::Tenant.current}} })
  end

end
