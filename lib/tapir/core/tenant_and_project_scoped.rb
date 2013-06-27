module TenantAndProjectScoped
  
  extend ActiveSupport::Concern

  included do

    belongs_to :tenant
    before_validation { self.tenant = Tapir::Tenant.current }

    belongs_to :project
    before_validation { self.project = Tapir::Project.current }

    default_scope(lambda { {:where => {:project_id => Tapir::Project.current, :tenant_id => Tapir::Tenant.current}} })
  end

end
