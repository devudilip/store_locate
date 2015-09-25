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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150925034935) do

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "tpnb"
  end

  create_table "store_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "store_id"
    t.integer  "quantity"
    t.boolean  "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "store_products", ["product_id"], name: "index_store_products_on_product_id"
  add_index "store_products", ["store_id"], name: "index_store_products_on_store_id"

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.decimal  "lat"
    t.decimal  "long"
    t.string   "pin"
    t.integer  "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "location_id"
    t.decimal  "store_distance"
    t.string   "store_type"
  end

end
