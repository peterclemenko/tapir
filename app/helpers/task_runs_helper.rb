module TaskRunsHelper

  def tapir_task_runs_path(task_runs=nil)
    "/task_runs"
  end

  def tapir_task_run_path(task_run=nil)
    "/task_runs/#{task_run._id}"
  end

  def display_associated_children
    result = ""
    @task_run.entity_mappings.each do |mapping|
      child = mapping.get_child
    
      unless child
        result << "<li> {missing} </li>"
      else
        result << "<li>#{link_to(child, entity_path(child))}</li>"
      end
    end
  result
  end


end
