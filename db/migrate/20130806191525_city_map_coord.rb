class CityMapCoord < ActiveRecord::Migration
  def change
    add_column :cities, :map_coord, :string
  end
end
