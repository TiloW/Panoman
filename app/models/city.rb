class City < ActiveRecord::Base
  include Named
  
  has_many :panoramas, :dependent => :destroy 
  
  after_initialize :default_values

  attr_accessible :name, :en_name, :map_id, :html_content
  
  validates :name, :presence => true, :uniqueness => true

  private
    def default_values
      self.name ||= "Neue Stadt"
    end
end