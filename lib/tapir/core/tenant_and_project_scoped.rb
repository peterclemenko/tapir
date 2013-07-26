module TenantAndProjectScoped
  
  extend ActiveSupport::Concern

  included do

    belongs_to :tenant
    before_validation { self.tenant = Tenant.current }

    belongs_to :project
    before_validation { self.project = Project.current }

    default_scope(lambda { {:where => {:project_id => Project.current, :tenant_id => Tenant.current}} })
  end

end
