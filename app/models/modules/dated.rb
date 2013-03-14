module Dated

  def get_german_month    
    I18n.l date_of_recording, :format => :month
    
  end  
  
  def get_english_month    
    I18n.locale = :en
    I18n.l date_of_recording, :format => :month
  end

end