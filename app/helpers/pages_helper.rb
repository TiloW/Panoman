# coding: utf-8

module PagesHelper

  def get_seperator
    #"<span>&raquo;</span>"
    ""
  end
  
  def get_city_breadcrumb
    tmp = @panorama.nil? ? city_path(@city) : city_path(@city, { :show_id => @panorama.id })
    "<a class=\"button\" href=\"#{tmp}\">#{@city.name}</a>"
  end
  
  def get_panorama_breadcrumb
    @city = @panorama.city      
    get_city_breadcrumb + get_seperator + "<a class=\"button\" href=\"#{panorama_path(@panorama)}\">#{@panorama.name}</a>"
  end
  
  def get_internal_link_breadcrumb
    @panorama = @internal_link.panorama
    get_panorama_breadcrumb + get_seperator + "<a class=\"button\" onClick=\"window.location.reload(true);\">Interner Link</a>"
  end
  
  def get_external_link_breadcrumb
    @panorama = @external_link.panorama
    get_panorama_breadcrumb + get_seperator + "<a class=\"button\" onClick=\"window.location.reload(true);\">" + @external_link.name + "</a>"
  end
  
  def get_hotspot_info_breadcrumb
    @panorama = @hotspot_info.panorama
    get_panorama_breadcrumb + get_seperator + "<a class=\"button\" onClick=\"window.location.reload(true);\">" + @hotspot_info.name + "</a>"
  end
  
  def prep_breadcrumb
    unless @internal_link.nil? or @internal_link.id.nil?
      get_internal_link_breadcrumb
    else unless @external_link.nil? or @external_link.id.nil?
      get_external_link_breadcrumb
    else unless @hotspot_info.nil? or @hotspot_info.id.nil?
      get_hotspot_info_breadcrumb
    else unless @panorama.nil? or @panorama.id.nil?
       get_panorama_breadcrumb
    else unless @city.nil? or @city.id.nil?
       get_city_breadcrumb
    else
      ""
    end end end end end
  end
  
  def get_breadcrumb
    result = prep_breadcrumb
    @city = @panorama.city unless @panorama.nil?
    tmp = @city.nil? ? cities_path() : cities_path({ :show_id => @city.id })
    (link_to "Städte", tmp, :class => "button") + result.html_safe
  end
  
end
