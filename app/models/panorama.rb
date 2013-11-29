class Panorama < ActiveRecord::Base
  include Named, Dated, Located
  
  acts_as_taggable
  
  has_many :external_links, :dependent => :destroy
  has_many :internal_links, :dependent => :destroy
  has_many :hotspot_infos, :dependent => :destroy
  
  after_initialize :default_values
  before_destroy :destroy_internal_links
  
  belongs_to :city
  
  attr_accessible :name,
                  :alt_name,
                  :en_name,
                  :alt_en_name,
                  :tag_list,
                  :description,
                  :date_of_recording,
                  :map_id,
                  :latitude,
                  :longitude,
                  :rotation,
                  :initial_center,
                  :initial_vertical,
                  :repeative,
                  :published,
                  :location,
                  :en_location,
                  :district,
                  :priority,
                  :exclusive,
                  :fotograf
                  
  validates :name, :presence => true, :uniqueness => {:scope => :city_id}
  
  validates :priority, :presence => true, :uniqueness => {:scope => :city_id}
  
  validates_numericality_of :latitude,
                            :longitude,
                            :rotation,
                            :initial_center,
                            :initial_vertical,
                            :priority, 
                            :allow_nil => true
                            
  private
    def default_values
      self.name ||= ""
      self.rotation ||= "20"
      self.initial_vertical ||= "250"
      self.repeative = true if self.repeative.nil?
      self.published = true if self.published.nil?
      self.priority ||= self.id
    end
    
    def destroy_internal_links
      InternalLink.where(:destination_id => self.id).each { |l| l.destroy }
    end
end
