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

ActiveRecord::Schema.define(version: 20150605115411) do

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.date     "date"
    t.date     "dateend"
    t.string   "title",        limit: 255
    t.string   "location",     limit: 255
    t.string   "link",         limit: 255
    t.string   "linktitle",    limit: 255
    t.string   "time",         limit: 255
    t.string   "more_link",    limit: 255
    t.string   "moreTitle",    limit: 255
    t.string   "description",  limit: 255
    t.string   "description2", limit: 255
    t.string   "description3", limit: 255
    t.string   "image_link",   limit: 255
    t.string   "imageAlt",     limit: 255
  end

end
