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

ActiveRecord::Schema.define(version: 20141205150440) do

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.integer  "batch_id"
    t.integer  "shopitem_id"
    t.integer  "shopitem_amount"
    t.float    "pay_amount",      limit: 24
    t.boolean  "selected"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotion_tags", force: true do |t|
    t.integer  "promotion_id"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", force: true do |t|
    t.string   "name"
    t.text     "descr"
    t.string   "image"
    t.date     "date_from"
    t.date     "date_to"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopitem_images", force: true do |t|
    t.integer  "shopitem_id"
    t.string   "image"
    t.text     "descr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopitem_tags", force: true do |t|
    t.integer  "shopitem_id"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopitems", force: true do |t|
    t.string   "code_name"
    t.string   "short_name"
    t.string   "long_name"
    t.integer  "stock"
    t.float    "price",      limit: 24
    t.integer  "sales"
    t.string   "image"
    t.text     "descr"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.integer  "wrong_try"
    t.boolean  "acclock"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
