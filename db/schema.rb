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

ActiveRecord::Schema.define(version: 20170914220031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "a", id: false, force: :cascade do |t|
    t.datetime "inserted_at", default: -> { "now()" }
    t.datetime "updated_at"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "role",                   default: "chef"
    t.integer  "restaurant_id",                           null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "evaluations", force: :cascade do |t|
    t.string  "user_id",    limit: 255, null: false
    t.integer "product_id",             null: false
    t.integer "score",                  null: false
    t.index ["product_id"], name: "idx_product_on_evaluations", unique: true, using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "product_id",             null: false
    t.string  "name",       limit: 255, null: false
    t.string  "group_name", limit: 20,  null: false
    t.integer "price",                  null: false
    t.boolean "basic"
    t.index ["product_id"], name: "idx_product_on_ingredients", unique: true, using: :btree
  end

  create_table "ingredients_orders", id: false, force: :cascade do |t|
    t.integer "product_order_id", null: false
    t.integer "ingredient_id",    null: false
    t.index ["ingredient_id"], name: "idx_ingredient_on_ingredients_orders", unique: true, using: :btree
    t.index ["product_order_id"], name: "idx_product_order_on_ingredients_orders", unique: true, using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string "user_id", limit: 255, null: false
    t.string "status",  limit: 20,  null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "restaurant_id",             null: false
    t.string  "title",         limit: 255, null: false
    t.text    "description",               null: false
    t.text    "image",                     null: false
    t.index ["restaurant_id"], name: "idx_restaurant_on_products", unique: true, using: :btree
  end

  create_table "products_orders", force: :cascade do |t|
    t.integer "product_id",  null: false
    t.integer "order_id",    null: false
    t.integer "quantity",    null: false
    t.integer "total_price", null: false
    t.index ["order_id"], name: "idx_order_on_products_orders", unique: true, using: :btree
    t.index ["product_id"], name: "idx_product_on_products_orders", unique: true, using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  add_foreign_key "evaluations", "products", name: "fk_product_on_evaluations"
  add_foreign_key "ingredients", "products", name: "fk_product_on_ingredients"
  add_foreign_key "ingredients_orders", "ingredients", name: "fk_ingredient_on_ingredients_orders"
  add_foreign_key "ingredients_orders", "products_orders", column: "product_order_id", name: "fk_product_on_ingredients_orders"
  add_foreign_key "products", "restaurants", name: "fk_restaurant_on_products"
  add_foreign_key "products_orders", "orders", name: "fk_order_on_product_orders"
  add_foreign_key "products_orders", "products", name: "fk_product_on_product_orders"
end
