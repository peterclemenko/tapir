module Tapir
class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  # This scopes all projects to the current tenant
  include TenantScoped

  field :name, type: String
  field :description, type: String
  validates_uniqueness_of :name, :scope => :tenant_id


  class << self
    def current
      Thread.current[:current_project]
    end
 
    def current=(project)
      Thread.current[:current_project] = project
    end
  end

end
end