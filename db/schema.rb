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

ActiveRecord::Schema.define(version: 20171022152802) do

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "train_id"
    t.integer "first_station_id"
    t.integer "last_station_id"
    t.integer "from_station_id"
    t.integer "to_station_id"
    t.integer "user_id"
    t.integer "wagon_id"
    t.index ["first_station_id"], name: "index_tickets_on_first_station_id"
    t.index ["from_station_id"], name: "index_tickets_on_from_station_id"
    t.index ["last_station_id"], name: "index_tickets_on_last_station_id"
    t.index ["to_station_id"], name: "index_tickets_on_to_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
    t.index ["wagon_id"], name: "index_tickets_on_wagon_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_station_id"
    t.integer "route_id"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wagons", force: :cascade do |t|
    t.string "variety"
    t.string "upper_seats"
    t.string "lower_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "train_id"
    t.index ["train_id"], name: "index_wagons_on_train_id"
  end

end
