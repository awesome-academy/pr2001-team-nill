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

ActiveRecord::Schema.define(version: 2020_06_26_091939) do

  create_table "bills", force: :cascade do |t|
    t.integer "cost_price"
    t.integer "table_id", null: false
    t.date "bill_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["table_id"], name: "index_bills_on_table_id"
  end

  create_table "book_details", force: :cascade do |t|
    t.integer "book_tables_id", null: false
    t.integer "dish_id", null: false
    t.integer "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_tables_id"], name: "index_book_details_on_book_tables_id"
    t.index ["dish_id"], name: "index_book_details_on_dish_id"
  end

  create_table "book_tables", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "table_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_tables_on_book_id"
    t.index ["table_id"], name: "index_book_tables_on_table_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_books_on_user_id"
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
    t.string "image_dish"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_dishes_on_category_id"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bills", "tables"
  add_foreign_key "book_details", "book_tables", column: "book_tables_id"
  add_foreign_key "book_details", "dishes"
  add_foreign_key "book_tables", "books"
  add_foreign_key "book_tables", "tables"
  add_foreign_key "books", "users"
  add_foreign_key "comments", "dishes"
  add_foreign_key "comments", "users"
  add_foreign_key "dishes", "categories"
  add_foreign_key "menu_dishes", "dishes"
  add_foreign_key "menu_dishes", "menus"
  add_foreign_key "reviews", "users"
end
