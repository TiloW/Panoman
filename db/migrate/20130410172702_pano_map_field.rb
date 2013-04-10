class PanoMapField < ActiveRecord::Migration
  def change
    add_column :panoramas, :map_id, :string
  end
end

