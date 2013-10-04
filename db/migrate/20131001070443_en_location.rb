class EnLocation < ActiveRecord::Migration
  def change
    add_column :panoramas, :en_location, :string
  end
end
