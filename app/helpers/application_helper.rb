# coding: utf-8

module ApplicationHelper
  
  def generateHotspotsJS(pano, objName = "pano")
    result = ""
    
    pano.hotspot_infos.each do |spot|
      result += "#{objName}.create"
      result += spot.is_circle ? "Circle" : "Rect"
      result += "Hotspot('#{spot.name}', #{spot.get_scaled_path}, 'info');\n"
    end
    
    pano.external_links.each do |spot|
      result += "#{objName}.create"
      result += spot.is_circle ? "Circle" : "Rect"
      result += "Hotspot('#{spot.name}', #{spot.get_scaled_path}, 'extern');\n"
    end
    
    pano.internal_links.each do |spot|
      result += "#{objName}.create"
      result += spot.is_circle ? "Circle" : "Rect"
      result += "Hotspot('<a href=\"" + panorama_path(spot.get_dest) + "\">#{spot.get_dest.name}</a>', #{spot.get_scaled_path}, 'intern');\n"
    end
    
    result.html_safe
  end
  
  def get_title
    title_base = "Panoman"

    if @title.nil?
      title_base
    else
      title_base + " :: " + @title
    end
  end
  
  def generate_table(name, header, data_collection, &row_generator)
    result = header.nil? ? "" : "<h2><span>#{name}</span></h2>"
    
    result += "<table>"
    unless header.nil?
      result += "<tr class=\"table-header\">"
      header.each  do |h| 
        css = ""
        if header.last == h
          css = " class=\"last\"" 
        end
        result += "<th#{css}>#{h}</th>"
      end
      result += "</tr>"
    end
    
    row_data = data_collection.collect(&row_generator)
    
    row_data.each do |row|
      result += "<tr class=\"row-id-" + row.shift.to_s + "\">"
        row.each do |attr|
          css = ""
          if row.last == attr
            css = " class=\"last\"" 
          end
          result += "<td#{css}>#{attr}</td>"
        end
      result += "</tr>"
    end
    result += "</table>"
    result.html_safe
  end
  
  def generate_chkbtn(controller, id, field, currentValue)
    (link_to currentValue ? "Ja" : "Nein", 
      {
        :controller => controller,
        :action => "switch_boolean",
        :id => id,
        :field => field
      },
      {
        :title => currentValue ? "Deaktivieren" : "Aktivieren",
        :class => "chkbtn " + (currentValue ? "checked" : "unchecked"),
        :remote => true
      }
    )
  end
  
end
