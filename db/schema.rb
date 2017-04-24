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

ActiveRecord::Schema.define(version: 20170423141244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_services", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "booking_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "booking_date"
    t.string   "booking_time"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "customer_id"
    t.date     "booking_date"
    t.time     "booking_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "branches", force: :cascade do |t|
    t.integer  "salon_id"
    t.string   "name"
    t.string   "area"
    t.string   "salon_email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.integer  "salon_id"
    t.integer  "branch_id"
    t.integer  "service_id"
    t.integer  "service_category_id"
    t.float    "discount_percent"
    t.date     "discount_date"
    t.time     "discount_time"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "salons", force: :cascade do |t|
    t.string   "salon_name"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "salon_img"
  end

  create_table "serv_styls", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "stylist_id"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "serv_styls", ["service_id"], name: "index_serv_styls_on_service_id", using: :btree
  add_index "serv_styls", ["stylist_id"], name: "index_serv_styls_on_stylist_id", using: :btree

  create_table "service_categories", force: :cascade do |t|
    t.string   "category"
    t.integer  "salon_id"
    t.integer  "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_stylists", force: :cascade do |t|
    t.integer  "service_category_id"
    t.integer  "stylist_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer  "salon_id"
    t.integer  "branch_id"
    t.integer  "service_category_id"
    t.string   "service_name"
    t.float    "price"
    t.float    "discount",            default: 0.0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "stylist_categories", force: :cascade do |t|
    t.integer  "salon_id"
    t.integer  "branch_id"
    t.integer  "service_category_id"
    t.string   "category"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "stylists", force: :cascade do |t|
    t.integer  "salon_id"
    t.integer  "branch_id"
    t.integer  "service_category_id"
    t.integer  "stylist_category_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "serv_styls", "services"
  add_foreign_key "serv_styls", "stylists"
end
