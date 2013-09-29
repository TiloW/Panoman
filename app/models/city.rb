class City < ActiveRecord::Base
  include Named
  
  has_many :panoramas, :dependent => :destroy 
  
  after_initialize :default_values

  attr_accessible :name, :en_name, :quiz, :map_id, :map_coord, :html_content, :linktips, :citytext, :ad_first_page_top, :ad_more_first_page_top, :ad_first_page_down, :ad_sec_page_top, :ad_sec_page_down, :en_ad_first_page_top, :en_ad_more_first_page_top, :en_ad_first_page_down, :en_ad_sec_page_top, :en_ad_sec_page_down
  
  validates :name, :presence => true, :uniqueness => true

  private
    def default_values
      self.name ||= "Neue Stadt"
    end
end