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

ActiveRecord::Schema.define(version: 20161214211426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "networks", force: true do |t|
    t.integer  "user_id"
    t.integer  "associate_id"
    t.boolean  "accepted_invite", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "networks", ["associate_id"], name: "index_networks_on_associate_id", using: :btree
  add_index "networks", ["user_id"], name: "index_networks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.datetime "birthday"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

end
