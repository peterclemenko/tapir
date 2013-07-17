module ReportTemplatesHelper

def render_children(item,result)
  result << "<ul>" 
    result << "<li>" << link_to(item, tapir_entity_path(item.id.to_s)) << "</li>" 
    item.children.each {|x| render_children(x,result) }
  result << "</ul>"
result
end


end
