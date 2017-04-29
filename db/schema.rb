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

ActiveRecord::Schema.define(version: 20170428213909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "divisions", force: :cascade do |t|
    t.date     "date"
    t.integer  "number"
    t.text     "name"
    t.string   "clock_time"
    t.string   "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mps", force: :cascade do |t|
    t.integer  "deputy_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "faction"
    t.integer  "okrug"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "mps", ["deputy_id"], name: "index_mps_on_deputy_id", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "division_id"
    t.integer  "deputy_id"
    t.string   "vote"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "votes", "divisions"
  add_foreign_key "votes", "mps", column: "deputy_id", primary_key: "deputy_id"
end