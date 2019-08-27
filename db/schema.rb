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

ActiveRecord::Schema.define(version: 2019_08_27_113015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combo_selections", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "combo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.bigint "restaurant_id"
    t.index ["combo_id"], name: "index_combo_selections_on_combo_id"
    t.index ["restaurant_id"], name: "index_combo_selections_on_restaurant_id"
    t.index ["user_id"], name: "index_combo_selections_on_user_id"
  end

  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_from_sponsor"
    t.string "food_type"
    t.index ["movie_id"], name: "index_combos_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.text "description"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_url"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "food_type"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_url"
    t.string "address"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "combo_selections", "combos"
  add_foreign_key "combo_selections", "restaurants"
  add_foreign_key "combo_selections", "users"
  add_foreign_key "combos", "movies"
end
