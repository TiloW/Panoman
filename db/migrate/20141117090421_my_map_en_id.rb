class MyMapEnId < ActiveRecord::Migration
  def change
    add_column :cities, :mymap_en_id, :string
  end
end
