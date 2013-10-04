class EnAdPanos < ActiveRecord::Migration
  def change
    add_column :cities, :en_ad_panos, :string
  end
end
