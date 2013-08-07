class Linktipps < ActiveRecord::Migration
  def change
    add_column :cities, :linktips, :string
  end
end