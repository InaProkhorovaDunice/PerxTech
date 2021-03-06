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

ActiveRecord::Schema.define(version: 20190614150328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rewards", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "reward_type", limit: 191
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sum",                    default: 0
    t.string   "country",    limit: 191
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 191
    t.string   "password",         limit: 191
    t.string   "first_name",       limit: 191
    t.string   "last_name",        limit: 191
    t.datetime "dob"
    t.string   "status",           limit: 191, default: "standard"
    t.integer  "points",                       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "month_points",                 default: 0
    t.string   "new",                          default: "registered"
    t.integer  "last_year_points",             default: 0
  end

  add_foreign_key "rewards", "users"
  add_foreign_key "transactions", "users"
end
