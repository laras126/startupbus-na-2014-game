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

ActiveRecord::Schema.define(version: 20140223175636) do

  create_table "buses", force: true do |t|
    t.string   "name"
    t.float    "ranking"
    t.integer  "conductor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conductors", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.string   "provider"
    t.string   "uid"
    t.datetime "approved_at"
  end

  add_index "conductors", ["email"], name: "index_conductors_on_email", unique: true
  add_index "conductors", ["reset_password_token"], name: "index_conductors_on_reset_password_token", unique: true

  create_table "investors", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.string   "provider"
    t.string   "uid"
  end

  add_index "investors", ["email"], name: "index_investors_on_email", unique: true
  add_index "investors", ["reset_password_token"], name: "index_investors_on_reset_password_token", unique: true

  create_table "milestones", force: true do |t|
    t.string   "name",                                null: false
    t.text     "description"
    t.integer  "max_points",              default: 0
    t.datetime "target_completion_date"
    t.text     "validation_instructions"
    t.text     "public_instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["name"], name: "index_milestones_on_name"
  add_index "milestones", ["target_completion_date"], name: "index_milestones_on_target_completion_date"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "twitter_handle"
    t.string   "facebook_url"
    t.string   "github_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bus_id"
  end

  add_index "teams", ["bus_id"], name: "index_teams_on_bus_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: ""
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
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "team_id"
    t.string   "team_status"
    t.datetime "approved_at"
    t.integer  "approved_by"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
