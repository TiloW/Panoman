class District < ActiveRecord::Migration
  def change
    add_column :panoramas, :district, :string
    add_column :panoramas, :location, :string
  end
end
