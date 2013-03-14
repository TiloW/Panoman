class ObsoleteAltNames < ActiveRecord::Migration
  def change
    remove_column :external_links, :alt_name
  end
end
