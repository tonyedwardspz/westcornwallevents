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

ActiveRecord::Schema.define(version: 20151228001434) do

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

  create_table "blogs", force: :cascade do |t|
    t.string  "title"
    t.text    "content"
    t.date    "date_published"
    t.string  "image"
    t.string  "blogs"
    t.string  "image_alt"
    t.text    "description"
    t.boolean "published",      default: false
    t.string  "slug"
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

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "user_events", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.date     "end_date"
    t.string   "location"
    t.string   "link"
    t.string   "image"
    t.string   "time"
    t.text     "description"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "user_email"
    t.boolean  "add_to_mailling_list", default: true
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_secure_token"
    t.string   "time_end"
    t.boolean  "archived",             default: false, null: false
    t.integer  "venue_id"
  end

  add_index "user_events", ["venue_id"], name: "index_user_events_on_venue_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "url"
    t.string   "address"
    t.string   "postcode"
    t.string   "image"
    t.string   "image_alt"
    t.text     "content"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "slug"
    t.string   "LinkAlt"
    t.boolean  "archived",   default: false
  end

  add_index "venues", ["slug"], name: "index_venues_on_slug", unique: true, using: :btree

  add_foreign_key "events", "event_users"
end
