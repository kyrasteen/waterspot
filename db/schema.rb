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

ActiveRecord::Schema.define(version: 20150502230028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "gauges", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "state"
    t.float    "lat"
    t.float    "long"
  end

  create_table "polygons", force: :cascade do |t|
    t.text     "shape"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "polygons", ["user_id"], name: "index_polygons_on_user_id", using: :btree

  create_table "spots", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "lat",        precision: 10, scale: 7
    t.decimal  "long",       precision: 10, scale: 7
    t.string   "rating"
  end

  add_index "spots", ["user_id"], name: "index_spots_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.string   "avatar"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
