class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_tenant
  before_filter :set_current_project

  def set_current_tenant

    # Grab the current host
    @current_tenant = Tapir::Tenant.current = Tapir::Tenant.where(:host => request.host).first

    # Create a tenant record for this host if none exists. 
    @current_tenant = Tapir::Tenant.current = Tapir::Tenant.create(:host => request.host) unless @current_tenant

  end

  def set_current_project

    # Grab the project name
    @current_project = Tapir::Project.current = Tapir::Project.where(:name => request.cookies['project']).first

    # Create a project record if none exists
    unless @current_project
      @current_project = Tapir::Project.current = Tapir::Project.create(:name => "default")
      cookies[:project] = {
        :value => Tapir::Project.current.name,
        :expires => 1.year.from_now
      }
    end
  end

end
