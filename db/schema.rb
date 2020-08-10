# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020200626085955) do

  create_table "bills", force: :cascade do |t|
    t.integer "cost_price"
    t.integer "table_id", null: false
    t.date "bill_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["table_id"], name: "index_bills_on_table_id"
  end

  create_table "booking_dishes", force: :cascade do |t|
    t.integer "booking_id", null: false
    t.integer "dish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_booking_dishes_on_booking_id"
    t.index ["dish_id"], name: "index_booking_dishes_on_dish_id"
  end

  create_table "booking_tables", force: :cascade do |t|
    t.integer "booking_id", null: false
    t.integer "table_id", null: false
    t.integer "person_bk"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_booking_tables_on_booking_id"
    t.index ["table_id"], name: "index_booking_tables_on_table_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "contents"
    t.integer "user_id", null: false
    t.integer "dish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_comments_on_dish_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.integer "money"
    t.string "image"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_dishes_on_category_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "dish_id", null: false
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_images_on_dish_id"
  end

  create_table "menu_dishes", force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "dish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_menu_dishes_on_dish_id"
    t.index ["menu_id"], name: "index_menu_dishes_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.integer "dish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_menus_on_dish_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.float "rate"
    t.string "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "status"
    t.integer "person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "level"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bills", "tables"
  add_foreign_key "booking_dishes", "bookings"
  add_foreign_key "booking_dishes", "dishes"
  add_foreign_key "booking_tables", "bookings"
  add_foreign_key "booking_tables", "tables"
  add_foreign_key "bookings", "users"
  add_foreign_key "comments", "dishes"
  add_foreign_key "comments", "users"
  add_foreign_key "dishes", "categories"
  add_foreign_key "images", "dishes"
  add_foreign_key "menu_dishes", "dishes"
  add_foreign_key "menu_dishes", "menus"
  add_foreign_key "menus", "dishes"
  add_foreign_key "reviews", "users"
end
