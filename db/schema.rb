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

ActiveRecord::Schema.define(version: 20140303134036) do

  create_table "conversations", force: true do |t|
    t.string   "theme"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations_users", id: false, force: true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations_users", ["conversation_id"], name: "index_conversations_users_on_conversation_id", using: :btree
  add_index "conversations_users", ["user_id", "conversation_id"], name: "index_conversations_users_on_user_id_and_conversation_id", using: :btree
  add_index "conversations_users", ["user_id"], name: "index_conversations_users_on_user_id", using: :btree

  create_table "event_requests", force: true do |t|
    t.integer  "event_id"
    t.integer  "photographer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_requests", ["event_id"], name: "index_event_requests_on_event_id", using: :btree
  add_index "event_requests", ["photographer_id"], name: "index_event_requests_on_photographer_id", using: :btree

  create_table "event_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "city"
    t.date     "date"
    t.string   "time"
    t.integer  "event_type_id"
    t.integer  "budget"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "events", ["customer_id"], name: "index_events_on_customer_id", using: :btree
  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "photographer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["photographer_id"], name: "index_images_on_photographer_id", using: :btree

  create_table "messages", force: true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name"
    t.integer  "photographer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["photographer_id"], name: "index_skills_on_photographer_id", using: :btree

  create_table "skills_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "skill_id"
  end

  add_index "skills_users", ["skill_id"], name: "index_skills_users_on_skill_id", using: :btree
  add_index "skills_users", ["user_id", "skill_id"], name: "index_skills_users_on_user_id_and_skill_id", using: :btree
  add_index "skills_users", ["user_id"], name: "index_skills_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "surname"
    t.string   "city"
    t.string   "vk"
    t.string   "facebook"
    t.string   "google"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
