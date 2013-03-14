class EnglishNames < ActiveRecord::Migration
  def change
    add_column :panoramas, :en_name, :string
    add_column :panoramas, :alt_en_name, :string
    
    add_column :cities, :en_name, :string
    
    add_column :internal_links, :alt_en_name, :string
    
    add_column :external_links, :en_name, :string
    add_column :external_links, :en_url, :string
  end
end
