class Quiz < ActiveRecord::Migration
  def change
    add_column :cities, :quiz, :boolean
  end
end
