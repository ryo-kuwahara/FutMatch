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

ActiveRecord::Schema.define(version: 20190705104652) do

  create_table "challenges", force: :cascade do |t|
    t.integer  "match_req_id"
    t.integer  "team_id"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
    t.string   "tel"
    t.string   "image"
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "match_reqs", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "title"
    t.text     "content"
    t.date     "match_date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "req_team_num"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "facility_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "room_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relations", force: :cascade do |t|
    t.integer  "receive_team_id"
    t.integer  "request_team_id"
    t.string   "comment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "name",       default: "新規チャット"
    t.text     "explain"
  end

  create_table "team_levels", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "level_name"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "name"
    t.string   "image"
    t.integer  "rank"
    t.string   "cat"
    t.integer  "age_ave"
    t.integer  "pref"
    t.text     "profile"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "facility_id"
    t.index ["email"], name: "index_teams_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teams_on_reset_password_token", unique: true
  end

end
