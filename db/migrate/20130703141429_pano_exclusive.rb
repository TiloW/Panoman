class PanoExclusive < ActiveRecord::Migration
  def change
    add_column :panoramas, :exclusive, :boolean
  end
end

