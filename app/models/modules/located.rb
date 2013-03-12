module Located
  include ActionView::Helpers::NumberHelper

  def get_coord(coord)
     coord.to_i.to_s +  "&deg; " + ((coord % 1)*60).to_i.to_s + "' " + (((coord *60) % 1)*60).to_i.to_s + '"'
  end

  def get_longitude_degree
    get_coord(longitude)
  end
  
  def get_latitude_degree
    get_coord(latitude)
  end
  
  def get_latitude precision = 6
    number_with_precision(latitude, :precision => precision)
  end
  
  def get_longitude precision = 6
    number_with_precision(longitude, :precision => precision)
  end
  
end