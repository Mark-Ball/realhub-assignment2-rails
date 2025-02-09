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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_23_215643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "title"
  end

  create_table "artworks", force: :cascade do |t|
    t.text "url"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "unit_number"
    t.integer "street_number"
    t.string "street_name"
    t.string "suburb_name"
  end

  create_table "order_items", force: :cascade do |t|
    t.string "title"
    t.integer "quantity"
    t.bigint "order_id"
    t.bigint "artwork_id"
    t.bigint "status_id"
    t.index ["artwork_id"], name: "index_order_items_on_artwork_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["status_id"], name: "index_order_items_on_status_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "agency_id"
    t.bigint "campaign_id"
    t.index ["agency_id"], name: "index_orders_on_agency_id"
    t.index ["campaign_id"], name: "index_orders_on_campaign_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "title"
  end

  add_foreign_key "order_items", "artworks"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "statuses"
  add_foreign_key "orders", "agencies"
  add_foreign_key "orders", "campaigns"
end
