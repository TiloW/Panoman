class AddAltNames < ActiveRecord::Migration
  def self.up
    add_column :external_links, :alt_name, :string
    add_column :internal_links, :alt_name, :string
    add_column :hotspot_infos, :alt_name, :string
    add_column :panoramas, :alt_name, :string
    add_column :internal_links, :linked_panorama_center, :integer
  end

  def self.down
  end
end
