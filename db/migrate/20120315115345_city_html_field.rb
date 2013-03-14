class CityHtmlField < ActiveRecord::Migration
  def change
    add_column :cities, :html_content, :string
  end
end
