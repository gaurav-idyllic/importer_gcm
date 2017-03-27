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

ActiveRecord::Schema.define(version: 20170327063959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "name_map"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company"
    t.string   "invoice_num"
    t.date     "invoice_date"
    t.date     "operation_date"
    t.decimal  "amount"
    t.string   "reporter"
    t.text     "notes"
    t.string   "status"
    t.integer  "operation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "company_categories", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "operations", force: :cascade do |t|
    t.string   "name"
    t.string   "name_map"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "attachment"
    t.string   "file_name"
    t.string   "original_file_name"
    t.integer  "total_records",      default: 0
    t.integer  "processed_records",  default: 0
    t.integer  "failed_records",     default: 0
    t.integer  "status",             default: 0
    t.text     "failure_msg",        default: ""
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
