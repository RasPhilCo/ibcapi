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

ActiveRecord::Schema.define(version: 20140901234512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "videos", force: true do |t|
    t.string   "yt_id"
    t.string   "title"
    t.string   "description"
    t.string   "player_url"
    t.integer  "view_count"
    t.integer  "favorite_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "yt_id_raw"
    t.integer  "popularity"
    t.boolean  "duplicate"
  end

  add_index "videos", ["yt_id"], name: "index_videos_on_yt_id", using: :btree

end
