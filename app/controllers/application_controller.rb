class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_current_tenant
  before_filter :set_current_project
  #before_filter :create_default_user_if_none_exists

  #def create_default_user_if_none_exists
  #end

  def set_current_tenant

    # Grab the current host
    @current_tenant = Tenant.current = Tenant.where(:host => request.host).first

    # Create a tenant record for this host if none exists. 
    @current_tenant = Tenant.current = Tenant.create(:host => request.host) unless @current_tenant

  end

  def set_current_project

    # Grab the project name
    @current_project = Project.current = Project.where(:name => request.cookies['project']).first

    # Create a project cookie if none exists
    unless @current_project
      @current_project = Project.current = Project.create(:name => "default")
      cookies.permanent[:project] = Project.current.name
    end
  end

end
