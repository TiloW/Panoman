class CreateExternalLinks < ActiveRecord::Migration
  def self.up
    create_table :external_links do |t|
      t.integer :panorama_id
      t.string :name
      t.string :url
      t.string :path

      t.timestamps
    end
    add_index :external_links, :panorama_id
  end

  def self.down
    drop_table :external_links
  end
end
