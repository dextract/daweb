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

ActiveRecord::Schema.define(version: 20131215122812) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.string   "blurb"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "homepage"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.integer  "user_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "contact_id"
    t.integer  "contactee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pending",      default: false
  end

  add_index "contacts", ["contact_id", "contactee_id"], name: "index_contacts_on_contact_id_and_contactee_id", unique: true
  add_index "contacts", ["contact_id"], name: "index_contacts_on_contact_id"
  add_index "contacts", ["contactee_id"], name: "index_contacts_on_contactee_id"

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "owner",      default: false
    t.boolean  "ex",         default: false
  end

  add_index "memberships", ["company_id"], name: "index_memberships_on_company_id"
  add_index "memberships", ["user_id", "company_id"], name: "index_memberships_on_user_id_and_company_id", unique: true
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "news", force: true do |t|
    t.string   "photo"
    t.string   "title"
    t.date     "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "news", ["user_id", "created_at"], name: "index_news_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "country"
    t.string   "description"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "email"
    t.boolean  "admin",               default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "company_id"
    t.integer  "owner_company"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
