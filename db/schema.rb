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

ActiveRecord::Schema.define(version: 2020_07_01_235359) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "author"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seller_id"
    t.boolean "sold", default: false, null: false
    t.index ["seller_id"], name: "index_books_on_seller_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "address"
    t.integer "balance", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
    t.integer "buyer_id"
    t.index ["book_id"], name: "index_orders_on_book_id", unique: true
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.integer "earnings", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
