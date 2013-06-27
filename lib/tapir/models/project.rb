module Tapir
class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  validates_uniqueness_of :name  

  # This scopes all projects to the current tenant
  include TenantScoped

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