module TaskRunsHelper

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
