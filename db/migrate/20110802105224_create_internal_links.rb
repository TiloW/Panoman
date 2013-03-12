class CreateInternalLinks < ActiveRecord::Migration
  def self.up
    create_table :internal_links do |t|
      t.integer :panorama_id
      t.integer :destination_id
      t.string :path

      t.timestamps
    end
    add_index :internal_links, :panorama_id
    add_index :internal_links, :destination_id
  end

  def self.down
    drop_table :internal_links
  end
end
