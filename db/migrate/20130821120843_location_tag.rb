class LocationTag < ActiveRecord::Migration
  def change
    create_table :locations do |l|
      l.string :name
    end

    create_table :loctaggings do |l|
      l.references :location

      # You should make sure that the column created is
      # long enough to store the required class names.
      l.references :taggable, :polymorphic => true
      l.references :tagger, :polymorphic => true

      # limit is created to prevent mysql error o index lenght for myisam table type.
      # http://bit.ly/vgW2Ql
      l.string :context, :limit => 128

      l.datetime :created_at
    end

    add_index :loctaggings, :location_id
    add_index :loctaggings, [:taggable_id, :taggable_type, :context]
  end
end
