class CityHtmlField < ActiveRecord::Migration
  def self.up
    add_column :cities, :html_content, :string
  end

  def self.down
  end
end
