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

ActiveRecord::Schema.define(version: 20170406183817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address"
    t.string   "city"
    t.string   "postal_code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "province_id"
    t.index ["province_id"], name: "index_addresses_on_province_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "phone_number"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "address_id"
    t.index ["address_id"], name: "index_customers_on_address_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.decimal  "price"
    t.integer  "qty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "total_price"
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "pst"
    t.decimal  "gst"
    t.decimal  "hst"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "address_id"
    t.integer  "customer_id"
    t.integer  "payment_id"
    t.integer  "order_status_id"
    t.decimal  "subtotal"
    t.decimal  "shipping"
    t.index ["address_id"], name: "index_orders_on_address_id", using: :btree
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
    t.index ["payment_id"], name: "index_orders_on_payment_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.string   "payment_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "address_id"
    t.integer  "order_id"
    t.decimal  "amount"
    t.index ["address_id"], name: "index_payments_on_address_id", using: :btree
    t.index ["order_id"], name: "index_payments_on_order_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "details"
    t.decimal  "price"
    t.string   "product_size"
    t.integer  "qty"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "category_id"
    t.string   "image"
    t.boolean  "active"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.decimal  "pst"
    t.decimal  "gst"
    t.decimal  "hst"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

end
