class Ads < ActiveRecord::Migration
  def change
    add_column :cities, :ad_first_page_top, :string
    add_column :cities, :ad_more_first_page_top, :string
    add_column :cities, :ad_first_page_down, :string
    add_column :cities, :ad_sec_page_top, :string
    add_column :cities, :ad_sec_page_down, :string
    
    add_column :cities, :en_ad_first_page_top, :string
    add_column :cities, :en_ad_more_first_page_top, :string
    add_column :cities, :en_ad_first_page_down, :string
    add_column :cities, :en_ad_sec_page_top, :string
    add_column :cities, :en_ad_sec_page_down, :string
  end
end
