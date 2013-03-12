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
    
    w = (tmp[0] - tmp[1]).abs
    x = [tmp[0], tmp[2]].min
    
    h = (tmp[1] - tmp[3]).abs
    y = [tmp[1],tmp[3]].min
    
    [x,y,w,h].join(",")
  end
  
end