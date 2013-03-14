class CreatePanoramas < ActiveRecord::Migration
  def change
    create_table :panoramas do |t|
      t.integer :city_id
      t.string :name
      t.string :description
      t.date :date_of_recording
      t.float :latitude
      t.float :longitude
      t.integer :rotation
      t.integer :initial_center
      t.integer :initial_vertical
      t.boolean :repeative

      t.timestamps
    end
    add_index :panoramas, :city_id
  end
end
