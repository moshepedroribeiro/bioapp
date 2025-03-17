# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_03_17_005322) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "culture_logs", force: :cascade do |t|
    t.float "pressure", null: false
    t.float "oxygen", null: false
    t.float "temperature", null: false
    t.float "ph", null: false
    t.float "concentration", null: false
    t.boolean "contaminants", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cultures", force: :cascade do |t|
    t.bigint "reactor_id", null: false
    t.bigint "microorganism_id", null: false
    t.date "culture_end_date", null: false
    t.datetime "activated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["microorganism_id"], name: "index_cultures_on_microorganism_id"
    t.index ["reactor_id", "microorganism_id", "culture_end_date"], name: "index_cultures_on_reactor_microorganism_and_date", unique: true
    t.index ["reactor_id"], name: "index_cultures_on_reactor_id"
  end

  create_table "microorganisms", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.bigint "desired_pressure", null: false
    t.bigint "desired_oxygen", null: false
    t.bigint "desired_temperature", null: false
    t.bigint "desired_ph", null: false
    t.datetime "activated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_microorganisms_on_code", unique: true
  end

  create_table "reactors", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "activated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_reactors_on_code", unique: true
  end

  add_foreign_key "cultures", "microorganisms"
  add_foreign_key "cultures", "reactors"
end
