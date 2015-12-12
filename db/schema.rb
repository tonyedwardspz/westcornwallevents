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

ActiveRecord::Schema.define(version: 20151212155450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_users", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.boolean "subscribed"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date"
    t.date     "dateend"
    t.string   "title"
    t.string   "location"
    t.string   "link"
    t.string   "linktitle"
    t.string   "time"
    t.string   "more_link"
    t.string   "moreTitle"
    t.text     "description"
    t.text     "description2"
    t.text     "description3"
    t.string   "image_link"
    t.string   "imageAlt"
    t.integer  "festival_id"
    t.integer  "venue_id"
    t.string   "slug"
    t.text     "description4"
    t.integer  "event_user_id"
    t.string   "time_end"
  end

  add_index "events", ["event_user_id"], name: "index_events_on_event_user_id", using: :btree
  add_index "events", ["festival_id"], name: "index_events_on_festival_id", using: :btree
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "festivals", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.date     "end_date"
    t.text     "content"
    t.string   "image"
    t.string   "image_alt"
    t.string   "image2"
    t.string   "image2_alt"
    t.string   "video1"
    t.string   "video2"
    t.string   "meta_title"
    t.string   "meta_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "summary"
    t.string   "snippet"
    t.string   "slug"
  end

  add_index "festivals", ["slug"], name: "index_festivals_on_slug", unique: true, using: :btree

