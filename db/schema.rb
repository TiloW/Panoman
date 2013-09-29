# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130929180238) do

  create_table "cities", :force => true do |t|
    t.text     "en_name"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "html_content"
    t.string   "map_id"
    t.string   "linktips"
    t.string   "map_coord"
    t.string   "ad_first_page_top"
    t.string   "ad_more_first_page_top"
    t.string   "ad_first_page_down"
    t.string   "ad_sec_page_top"
    t.string   "ad_sec_page_down"
    t.string   "en_ad_first_page_top"
    t.string   "en_ad_more_first_page_top"
    t.string   "en_ad_first_page_down"
    t.string   "en_ad_sec_page_top"
    t.string   "en_ad_sec_page_down"
    t.boolean  "quiz"
    t.string   "citytext"
  end

  create_table "external_links", :force => true do |t|
    t.text     "en_url"
    t.integer  "panorama_id"
    t.string   "name"
    t.string   "url"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "en_name"
  end

  create_table "hotspot_infos", :force => true do |t|
    t.integer  "panorama_id"
    t.string   "name"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alt_name"
  end

  add_index "hotspot_infos", ["panorama_id"], :name => "index_hotspot_infos_on_panorama_id"

  create_table "internal_links", :force => true do |t|
    t.text     "alt_en_name"
    t.integer  "panorama_id"
    t.integer  "destination_id"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alt_name"
    t.integer  "linked_panorama_center"
  end

  create_table "panoramas", :force => true do |t|
    t.text     "location"
    t.text     "district"
    t.text     "en_name"
    t.text     "alt_en_name"
    t.integer  "city_id"
    t.string   "name"
    t.string   "description"
    t.date     "date_of_recording"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "rotation"
    t.integer  "initial_center"
    t.integer  "initial_vertical"
    t.boolean  "repeative"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alt_name"
    t.integer  "priority"
    t.boolean  "published"
    t.string   "map_id"
    t.boolean  "exclusive"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
