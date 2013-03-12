class PanoramaPrioritiy < ActiveRecord::Migration
  def self.up
    add_column :panoramas, :priority, :integer
  end

  def self.down
  end
end
