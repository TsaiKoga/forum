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

ActiveRecord::Schema.define(version: 20131027140056) do

  create_table "nodes", force: true do |t|
    t.string   "name"
    t.string   "summary"
    t.integer  "sort",         default: 0
    t.integer  "topics_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section_id"
  end

  create_table "notification_bases", force: true do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.boolean  "read",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replies", force: true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "like_num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "liked_user_ids"
  end

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "sort",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "title"
    t.integer  "read_num",       default: 0
    t.integer  "like_num",       default: 0
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "who_deleted"
    t.integer  "node_id"
    t.string   "liked_user_ids"
    t.integer  "replies_count",  default: 0
  end

  add_index "topics", ["user_id", "created_at"], name: "index_topics_on_user_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "introduction"
    t.string   "signature"
    t.string   "favorite_topic_ids"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
