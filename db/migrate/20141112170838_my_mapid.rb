class MyMapid < ActiveRecord::Migration
  def change
    add_column :cities, :mymap_id, :string
  end
end
