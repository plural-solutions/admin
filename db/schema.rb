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

ActiveRecord::Schema.define(version: 20170924000115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string   "user_id",          limit: 255,                          null: false
    t.integer  "product_order_id",                                      null: false
    t.integer  "score",                                                 null: false
    t.datetime "inserted_at",                  default: -> { "now()" }
    t.datetime "updated_at"
    t.index ["product_order_id"], name: "idx_product_order_on_evaluations", using: :btree
  end

  create_table "ingredient_groups", force: :cascade do |t|
    t.string   "title",       limit: 255,                          null: false
    t.boolean  "basic"
    t.integer  "product_id",                                       null: false
    t.datetime "inserted_at",             default: -> { "now()" }
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_ingredient_groups_on_deleted_at", using: :btree
    t.index ["product_id"], name: "idx_product_on_ingredients", using: :btree
  end

  create_table "ingredient_product_orders", id: false, force: :cascade do |t|
    t.integer  "product_order_id",                          null: false
    t.integer  "ingredient_id",                             null: false
    t.datetime "inserted_at",      default: -> { "now()" }
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_ingredient_product_orders_on_deleted_at", using: :btree
    t.index ["ingredient_id"], name: "idx_ingredient_on_ingredient_product_orders", using: :btree
    t.index ["product_order_id"], name: "idx_product_order_on_ingredient_product_orders", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer  "ingredient_group_id",                                      null: false
    t.string   "name",                limit: 255,                          null: false
    t.integer  "price_cents"
    t.datetime "inserted_at",                     default: -> { "now()" }
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_ingredients_on_deleted_at", using: :btree
    t.index ["ingredient_group_id"], name: "idx_ingredient_group_on_ingredients", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "user_id",       limit: 255,                          null: false
    t.integer  "restaurant_id",                                      null: false
    t.string   "status",        limit: 20,                           null: false
    t.datetime "inserted_at",               default: -> { "now()" }
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_orders_on_deleted_at", using: :btree
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer  "product_id",                                 null: false
    t.integer  "order_id",                                   null: false
    t.integer  "quantity",                                   null: false
    t.integer  "total_price_cents",                          null: false
    t.datetime "inserted_at",       default: -> { "now()" }
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_product_orders_on_deleted_at", using: :btree
    t.index ["order_id"], name: "idx_order_on_product_orders", using: :btree
    t.index ["product_id"], name: "idx_product_on_product_orders", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "restaurant_id",                                      null: false
    t.string   "title",         limit: 255,                          null: false
    t.text     "description",                                        null: false
    t.string   "image",         limit: 255,                          null: false
    t.integer  "price_cents",                                        null: false
    t.datetime "inserted_at",               default: -> { "now()" }
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
    t.index ["restaurant_id"], name: "idx_restaurant_on_products", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",        limit: 100,                          null: false
    t.datetime "inserted_at",             default: -> { "now()" }
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_restaurants_on_deleted_at", using: :btree
  end

  add_foreign_key "evaluations", "product_orders", name: "fk_product_order_on_evaluations"
  add_foreign_key "ingredient_groups", "products", name: "fk_product_on_ingredient_groups"
  add_foreign_key "ingredient_product_orders", "ingredients", name: "fk_ingredient_on_ingredient_product_orders"
  add_foreign_key "ingredient_product_orders", "product_orders", name: "fk_product_on_ingredient_product_orders"
  add_foreign_key "ingredients", "ingredient_groups", name: "fk_ingredient_group_on_ingredients"
  add_foreign_key "orders", "restaurants", name: "fk_restaurant_on_orders"
  add_foreign_key "product_orders", "orders", name: "fk_order_on_product_orders"
  add_foreign_key "product_orders", "products", name: "fk_product_on_product_orders"
  add_foreign_key "products", "restaurants", name: "fk_restaurant_on_products"
end
