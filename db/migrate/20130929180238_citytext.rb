class Citytext < ActiveRecord::Migration
  def change
    add_column :cities, :citytext, :string
  end
end
