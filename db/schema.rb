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

ActiveRecord::Schema.define(version: 20160718015824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string   "path",                       null: false
    t.integer  "product_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "main",       default: false
  end

  add_index "images", ["product_id"], name: "index_images_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "quantity",   default: 1
    t.integer  "integer",    default: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "status",     default: "pending"
  end

  add_index "orders", ["product_id"], name: "index_orders_on_product_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",                          null: false
    t.float    "price"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "discount",          default: 0
    t.string   "slug"
    t.string   "small_description"
    t.integer  "star",              default: 0
  end

  add_index "products", ["slug"], name: "index_products_on_slug", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip_code"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "number"
    t.string   "neighborhood"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "images", "products"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
end
