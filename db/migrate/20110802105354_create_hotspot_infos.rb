class CreateHotspotInfos < ActiveRecord::Migration
  def self.up
    create_table :hotspot_infos do |t|
      t.integer :panorama_id
      t.string :name
      t.string :path

      t.timestamps
    end
    add_index :hotspot_infos, :panorama_id
  end

  def self.down
    drop_table :hotspot_infos
  end
end
