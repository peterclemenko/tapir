class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  # GET /tapir/projects
  # GET /tapir/projects.json
  def index
    @projects = Tapir::Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

end
