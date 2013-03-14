class PanoramaPublished < ActiveRecord::Migration
  def change
    add_column :panoramas, :published, :boolean
  end
end
