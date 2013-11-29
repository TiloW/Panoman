class Mobilebanner < ActiveRecord::Migration
  def change
    add_column :cities, :ad_mobile_banner, :string    
    add_column :cities, :en_ad_mobile_banner, :string
  end
end
