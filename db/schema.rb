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

ActiveRecord::Schema.define(version: 20150208103006) do

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "in_charge"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.string   "afm"
    t.text     "address"
    t.string   "city"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "organization_id"
  end

  add_index "customers", ["organization_id"], name: "index_customers_on_organization_id"
  add_index "customers", ["user_id"], name: "index_customers_on_user_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "afm"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.integer  "organization_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "product_categories", ["organization_id"], name: "index_product_categories_on_organization_id"
  add_index "product_categories", ["user_id"], name: "index_product_categories_on_user_id"

  create_table "product_categories_products", id: false, force: :cascade do |t|
    t.integer "product_category_id"
    t.integer "product_id"
  end

  add_index "product_categories_products", ["product_category_id"], name: "index_product_categories_products_on_product_category_id"
  add_index "product_categories_products", ["product_id"], name: "index_product_categories_products_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "code"
    t.decimal  "organization_id"
    t.decimal  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "afm"
    t.string   "support_email"
    t.string   "sales_email"
    t.string   "support_phone"
    t.string   "sales_phone"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "country"
    t.string   "in_charge"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "suppliers", ["organization_id"], name: "index_suppliers_on_organization_id"
  add_index "suppliers", ["user_id"], name: "index_suppliers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "afm"
    t.string   "auth_token"
    t.boolean  "is_admin",               default: false
    t.integer  "organization_id"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["organization_id"], name: "index_users_on_organization_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
