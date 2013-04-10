class MapField < ActiveRecord::Migration
  def change
    add_column :cities, :map_id, :string
  end
end
