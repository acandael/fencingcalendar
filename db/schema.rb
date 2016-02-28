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

ActiveRecord::Schema.define(version: 20160228123550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "link"
  end

  create_table "tournament_weapons", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "weapon_id"
  end

  add_index "tournament_weapons", ["tournament_id"], name: "index_tournament_weapons_on_tournament_id", using: :btree
  add_index "tournament_weapons", ["weapon_id"], name: "index_tournament_weapons_on_weapon_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.string   "location"
    t.integer  "country_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "organization_id"
    t.date     "end_date"
    t.date     "closing_date"
  end

  add_index "tournaments", ["category_id"], name: "index_tournaments_on_category_id", using: :btree

  create_table "weapons", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "tournament_weapons", "tournaments"
  add_foreign_key "tournament_weapons", "weapons"
  add_foreign_key "tournaments", "categories"
end
