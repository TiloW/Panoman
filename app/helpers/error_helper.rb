# coding: utf-8

module ErrorHelper
  
  def get_errors_for(obj)
    unless obj.nil?
      error_detail = ""
      obj.attributes.each do |a|
        tmp = get_errors_for_attr(obj, a.first.to_sym) 
        unless tmp.nil?
          error_detail += "<li>#{a.first}#{tmp}</li>"
        end
      end
      "<ul>#{error_detail}</ul>".html_safe
    else
      ""
    end
  end
 
  def get_errors_for_attr(object, attribute)
    errors = object.errors[attribute]
    if errors.length > 0
      errors = [errors] unless errors.is_a?(Array)
      "<ul>" + errors.map {|e| "<li> &rsaquo; " + e + "</li>"}.join + "</ul>"
    else
      nil
    end
  end
  
  def register_error(msg, faulty_object)
    flash[:error] = msg
    flash[:error_details] = get_errors_for(faulty_object)
  end
  
end