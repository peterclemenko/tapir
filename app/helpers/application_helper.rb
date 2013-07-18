module ApplicationHelper

  def tapir_entities_path(id=nil)
    "/tapir/entities/#{id}"
  end
  
  def render_children(item,result)
    result << "<ul>" 
    item.children.each do |x| 
      result << print_result(item)
      render_children(x,result)
    end
    result << "</ul>"
  
  result
  end

  def render_parents(item,result)
    result << "<ul>"
    item.parents.each do |x|
      result << print_result(item)
      render_parents(x,result)
    end
    result << "</ul>"
  result
  end

  def print_result(item)
    #binding.pry
    # << " (#{item.task_runs.where(:task_entity_id => item.id).first}) " 
    "<li>" << link_to(item, tapir_entity_path(item.id.to_s)) << "</li>"   
  end

end
