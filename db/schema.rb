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

ActiveRecord::Schema.define(version: 2018_08_30_111945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "links", force: :cascade do |t|
    t.string "original_url", null: false
    t.string "short_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_code"], name: "index_links_on_short_code", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "link_id"
    t.string "ip", default: ""
    t.string "country", default: ""
    t.string "city", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_visits_on_link_id"
  end

  add_foreign_key "visits", "links"
end
