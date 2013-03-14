class CreateHotspotInfos < ActiveRecord::Migration
  def change
    create_table :hotspot_infos do |t|
      t.integer :panorama_id
      t.string :name
      t.string :path

      t.timestamps
    end
    add_index :hotspot_infos, :panorama_id
  end
end
