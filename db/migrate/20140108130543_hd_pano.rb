class HdPano < ActiveRecord::Migration
  def change
    add_column :panoramas, :hdpano, :boolean
  end
end
