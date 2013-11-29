class Fotograf < ActiveRecord::Migration
  def change
    add_column :panoramas, :fotograf, :string
  end
end
