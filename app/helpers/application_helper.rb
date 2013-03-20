# coding: utf-8

module ApplicationHelper
  
  def generateHotspotFunctionCall(pano, objName, spot, content, category)
      result = "#{objName}.create"
      result += spot.is_circle ? "Circle" : "Rect"
      result + "Hotspot(\"#{content.gsub('"', "'")}\", #{spot.get_scaled_path_sp}, \"#{category}\");\n"
  end
  
  def generateHotspotsJS(pano, objName = "pano")
    result = ""
    
    orderedHotspots = []
    
    pano.hotspot_infos.each{ |s| orderedHotspots.push s }
    pano.external_links.each{ |s| orderedHotspots.push s }
    pano.internal_links.each{ |s| orderedHotspots.push s }
    
    orderedHotspots.sort_by!{ |s| -s.get_area }
    
    orderedHotspots.each do |spot|
      result += if spot.is_a? HotspotInfo
        generateHotspotFunctionCall(pano, objName, spot, '<span class="title">' + spot.name + '</span>', 'info')
      elsif spot.is_a? ExternalLink
        generateHotspotFunctionCall(pano, objName, spot, '<span class="title">' + spot.name + '</span>', 'extern')
      else
        generateHotspotFunctionCall(pano, objName, spot, "<a href=\"" + panorama_path(spot.get_dest) + "\"><span class=\"title\">#{spot.alt_name.blank? ? spot.get_dest.name : spot.alt_name}</span></a>", 'intern')
      end
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
