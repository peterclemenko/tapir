module ApplicationHelper

  def render_children(entity)
    return result = "" if entity.children.empty?
    
    result << "<ul>"  
    entity.children.each do |x|
      result << print_result(x)
      result << render_children(x)
    end
    result << "</ul>"

  result
  end

  def render_parents(entity)
    return result = "" if entity.parents.empty?
    
    result << "<ul>"
    entity.parents.each do |x|
      result << print_result(x)
      result << render_parents(x)
    end
    result << "</ul>"

  result
  end

  def print_result(entity)
    # << " (#{item.task_runs.where(:task_entity_id => item.id).first}) " 
    "<li>" << link_to(entity, entity_path(entity)) << "</li>"   
  end

end
