class InternalLink < ActiveRecord::Base
  include Hotspot
  
  belongs_to :panorama
  
  attr_accessible :destination_id,
                  :alt_name,
                  :alt_en_name,
                  :linked_panorama_center,
                  :path
                  
  validates :destination_id, :presence => true, :uniqueness => {:scope => :panorama_id}
  
  validates_numericality_of :linked_panorama_center, :allow_nil => true
  
  validates_format_of :path, :with => /^(\d+,)?\d+,\d+,\d+$/,
    :message => "drei bis vier ganze Zahlen geteilt durch Kommata eingeben"
    
  def get_dest
    Panorama.find(destination_id)
  end
    
  def get_name
    alt_name.nil? || alt_name.empty? ? get_dest.name : alt_name
  end
        
  def get_en_name
    alt_en_name.nil? || alt_en_name.empty? ? get_dest.en_name : alt_en_name
  end
    
  private
    def default_values
      self.alt_name ||= ""
    end
end