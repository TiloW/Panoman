module Hotspot
  
  def get_scaled_path factor = 1
    get_scaled_nums(factor).join(',')
  end
  
  def get_scaled_nums factor
    path.split(',').map! { |s| s.to_i*factor }
  end
  
  def is_circle
    path.split(',').length == 3
  end
  
  def is_rectangle
    path.split(',').length == 4
  end
  
  def get_xywh factor = 1
    tmp = get_scaled_nums(factor)
    
    w = (tmp[0] - tmp[2]).abs
    x = [tmp[0], tmp[2]].min
    
    h = (tmp[1] - tmp[3]).abs 
    y = [tmp[1],tmp[3]].min
    
    [x,y,w-2,h-2].join(",")
  end
  
  def get_scaled_path_sp factor = 1
    is_circle ? get_scaled_path(factor) : get_xywh(factor)
  end
  
  def get_area factor = 1
    if is_circle
      Math::PI * get_scaled_nums(factor)[2]**2
    else
      tmp = get_scaled_nums(factor)
      ((tmp[0] - tmp[2])*(tmp[1] - tmp[3])).abs
    end
  end
  
end