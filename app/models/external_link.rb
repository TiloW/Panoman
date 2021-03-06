class ExternalLink < ActiveRecord::Base
  include Hotspot, Named
  
  belongs_to :panorama
  
  after_initialize :default_values
  
  attr_accessible :name, 
                  :en_name,
                  :url,
                  :en_url,
                  :path
                  
  validates :name, :presence => true, :uniqueness => {:scope => :panorama_id}
  validates :url, :presence => true, :uniqueness => {:scope => :panorama_id}
  
  validates_format_of :path, :with => /^(\d+,)?\d+,\d+,\d+$/,
    :message => "drei bis vier ganze Zahlen geteilt durch Kommata eingeben"
    
  private
    def default_values
      self.name ||= ""
    end
end
