# encoding: UTF-8

ActiveRecord::Schema.define(version: 20160427174036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artworks", force: :cascade do |t|
    t.string   "title"
    t.string   "image_url"
    t.boolean  "featured"
    t.boolean  "for_sale"
    t.string   "artwork_type"
    t.string   "media"
    t.string   "size"
    t.string   "price"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "order"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.string   "image_url"
    t.boolean  "featured"
    t.string   "image_type"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
