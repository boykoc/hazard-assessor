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

ActiveRecord::Schema.define(version: 20150605003917) do

  create_table "actions", force: :cascade do |t|
    t.integer  "hazard_id"
    t.text     "content"
    t.boolean  "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "actions", ["hazard_id"], name: "index_actions_on_hazard_id"

  create_table "assessments", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "workplace"
  end

  add_index "assessments", ["user_id"], name: "index_assessments_on_user_id"

  create_table "hazards", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.string   "exposure"
    t.string   "occurance"
    t.string   "probability"
    t.string   "consequence"
    t.string   "rating"
    t.text     "control"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "assessment_id"
  end

  add_index "hazards", ["assessment_id"], name: "index_hazards_on_assessment_id"

  create_table "needed_controls", force: :cascade do |t|
    t.integer  "hazard_id"
    t.text     "content"
    t.boolean  "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "needed_controls", ["hazard_id"], name: "index_needed_controls_on_hazard_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
