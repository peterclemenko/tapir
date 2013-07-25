module ProjectHelper
  
  def tapir_project_path(project=nil, whatever=nil)
    "/projects/#{project._id}"
  end

  def tapir_projects_path(project=nil)
    "/projects"
  end
end