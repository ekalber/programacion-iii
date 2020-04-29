# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_28_080257) do

  create_table "dischargues", force: :cascade do |t|
    t.integer "liters"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "load_id"
    t.integer "station_id"
    t.index ["load_id"], name: "index_dischargues_on_load_id"
    t.index ["station_id"], name: "index_dischargues_on_station_id"
  end

  create_table "loads", force: :cascade do |t|
    t.integer "liters"
    t.datetime "date"
    t.float "liter_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "truck_id"
    t.index ["truck_id"], name: "index_loads_on_truck_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "address"
    t.string "flag"
    t.integer "max_liters"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trucks", force: :cascade do |t|
    t.string "patent"
    t.string "description"
    t.integer "max_liters"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "dischargues", "loads"
  add_foreign_key "dischargues", "stations"
  add_foreign_key "loads", "trucks"
end
