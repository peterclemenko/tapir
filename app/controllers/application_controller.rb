class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_current_tenant
  before_filter :set_current_project
  before_filter :set_current_types
  #before_filter :create_default_user_if_none_exists

  #def create_default_user_if_none_exists
  #end

  # Public: This method sets the current types if the session variable hasn't been
  # set. This allows us to do filtering on the entities.
  #
  # returns nothing
  def set_current_types
    session["view_types"] = _get_valid_type_class_names unless session["view_types"]
  end

  # Public: This method sets the current tenant for this user based on the request.host submission
  #
  # returns nothing
  def set_current_tenant

    # Grab the current host
    @current_tenant = Tenant.current = Tenant.where(:host => request.host.to_s.downcase).first

    # Create a tenant record for this host if none exists. 
    @current_tenant = Tenant.current = Tenant.create(:host => request.host.to_s.downcase) unless @current_tenant
  end


  # Public: This method sets the current project for this user, based on the cookie value for 'project'
  #
  # returns nothing
  def set_current_project

    # Grab the project name
    @current_project = Project.current = Project.where(:name => request.cookies['project']).first

    # Create a project cookie if none exists
    unless @current_project
      @current_project = Project.current = Project.create(:name => "default")
      cookies.permanent[:project] = Project.current.name
    end
  end

  private

    # Return the valid entity types
    def _get_valid_type_class_names
      types = Entities::Base.descendants.map{|x| x.name.split("::").last}
    types.sort_by{ |t| t.downcase }
    end


    # Return the valid entity types
    def _get_valid_types
      types = Entities::Base.descendants
    end


end
