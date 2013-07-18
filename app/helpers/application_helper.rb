module ApplicationHelper

  def tapir_entities_path(id=nil)
    "/tapir/entities/#{id}"
  end
  
  def render_children(item,result)
    return "" if item.children.empty?

    result << "<ul>" 
    item.children.each do |x| 
      result << print_result(x)
      render_children(x,result)
    end
    result << "</ul>"
  
  result
  end

  def render_parents(item,result)
    # Base case
    return "" if item.parents.empty?
        
    result << "<ul>"

    
    # Call render on each of the parents
    item.parents.each do |x|
          
    end


    # Print all the parents
    item.parents.each do |x|
      result << print_result(x)
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
