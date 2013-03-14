class PanoramaPrioritiy < ActiveRecord::Migration
  def change
    add_column :panoramas, :priority, :integer
  end
end
