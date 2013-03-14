class CreateExternalLinks < ActiveRecord::Migration
  def change
    create_table :external_links do |t|
      t.integer :panorama_id
      t.string :name
      t.string :url
      t.string :path

      t.timestamps
    end
    add_index :external_links, :panorama_id
  end
end
