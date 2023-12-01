# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_30_231633) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "role_user", ["user", "admin"]

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "street", null: false
    t.string "neighborhood", null: false
    t.string "number", null: false
    t.string "zipcode", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.boolean "main", default: false, null: false
    t.decimal "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_addresses_on_id", unique: true
    t.index ["user_id"], name: "addresses_user"
  end

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_categories_on_id", unique: true
    t.index ["name"], name: "categories_name"
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description", default: "", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.uuid "category_id", null: false
    t.boolean "publish", default: false, null: false
    t.boolean "promo", default: false
    t.decimal "promo_price", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["id"], name: "index_products_on_id", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.string "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.enum "role", default: "user", null: false, enum_type: "role_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "email"], name: "index_users_on_id_and_email", unique: true
  end

  add_foreign_key "products", "categories"
end
