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

ActiveRecord::Schema.define(version: 20131019063856) do

  create_table "customers", force: true do |t|
    t.integer  "c_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "request_histories", force: true do |t|
    t.integer  "request_id"
    t.string   "comments"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_histories", ["request_id"], name: "index_request_histories_on_request_id", using: :btree

  create_table "request_schedules", force: true do |t|
    t.integer  "request_id"
    t.datetime "start_time"
    t.datetime "end_date"
    t.string   "phone_number"
    t.string   "address"
    t.integer  "s_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_schedules", ["request_id"], name: "index_request_schedules_on_request_id", using: :btree

  create_table "requests", force: true do |t|
    t.integer  "status"
    t.integer  "customer_id"
    t.integer  "service_type_id"
    t.integer  "service_id"
    t.integer  "resource_id"
    t.decimal  "charge",          precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "budget",          precision: 12, scale: 2
    t.string   "query"
    t.string   "title"
  end

  add_index "requests", ["customer_id"], name: "index_requests_on_customer_id", using: :btree
  add_index "requests", ["resource_id"], name: "index_requests_on_resource_id", using: :btree
  add_index "requests", ["service_id"], name: "index_requests_on_service_id", using: :btree
  add_index "requests", ["service_type_id"], name: "index_requests_on_service_type_id", using: :btree

  create_table "resource_ratings", force: true do |t|
    t.integer  "resource_id"
    t.integer  "rating"
    t.integer  "request_id"
    t.integer  "customer_id"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_ratings", ["customer_id"], name: "index_resource_ratings_on_customer_id", using: :btree
  add_index "resource_ratings", ["request_id"], name: "index_resource_ratings_on_request_id", using: :btree
  add_index "resource_ratings", ["resource_id"], name: "index_resource_ratings_on_resource_id", using: :btree

  create_table "resource_services", force: true do |t|
    t.integer  "resource_id"
    t.integer  "service_type_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_services", ["resource_id"], name: "index_resource_services_on_resource_id", using: :btree
  add_index "resource_services", ["service_id"], name: "index_resource_services_on_service_id", using: :btree
  add_index "resource_services", ["service_type_id"], name: "index_resource_services_on_service_type_id", using: :btree

  create_table "resources", force: true do |t|
    t.integer  "user_id"
    t.integer  "r_type"
    t.decimal  "average_rating", precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["user_id"], name: "index_resources_on_user_id", using: :btree

  create_table "service_types", force: true do |t|
    t.string   "name"
    t.integer  "s_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "image_url"
    t.decimal  "charge",          precision: 12, scale: 2
    t.integer  "service_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["service_type_id"], name: "index_services_on_service_type_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "address"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
