class Citxtext2 < ActiveRecord::Migration
  def change
    add_column :cities, :citytext2, :string
    add_column :cities, :citytext3, :string
  end
end