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

ActiveRecord::Schema.define(version: 20170611102619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.text     "subtitle"
    t.integer  "max_participants"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_articles_on_activity_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "child_activities", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.integer  "max_participant"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "children", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.date     "birth_date"
    t.string   "school"
    t.string   "classe"
    t.text     "extra_info"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_children_on_user_id", using: :btree
  end

  create_table "grown_activities", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.integer  "max_participants"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "grown_activity_articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "grown_activity_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["grown_activity_id"], name: "index_grown_activity_articles_on_grown_activity_id", using: :btree
  end

  create_table "grown_inscriptions", force: :cascade do |t|
    t.integer  "grown_activity_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["grown_activity_id"], name: "index_grown_inscriptions_on_grown_activity_id", using: :btree
    t.index ["user_id"], name: "index_grown_inscriptions_on_user_id", using: :btree
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_inscriptions_on_activity_id", using: :btree
    t.index ["child_id"], name: "index_inscriptions_on_child_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "civility"
    t.string   "main_phone"
    t.string   "secondary_phone"
    t.string   "activity_admin"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "articles", "activities"
  add_foreign_key "children", "users"
  add_foreign_key "grown_activity_articles", "grown_activities"
  add_foreign_key "grown_inscriptions", "grown_activities"
  add_foreign_key "grown_inscriptions", "users"
  add_foreign_key "inscriptions", "activities"
  add_foreign_key "inscriptions", "children"
end
