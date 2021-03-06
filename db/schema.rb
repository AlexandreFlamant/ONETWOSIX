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

ActiveRecord::Schema.define(version: 2019_09_02_135934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.bigint "restaurant_id"
    t.index ["movie_id"], name: "index_combos_on_movie_id"
    t.index ["restaurant_id"], name: "index_combos_on_restaurant_id"
  end

  create_table "food_types", force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_url"
    t.bigint "genre_id"
    t.index ["genre_id"], name: "index_movies_on_genre_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_url"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "food_type_id"
    t.index ["food_type_id"], name: "index_restaurants_on_food_type_id"
  end

  create_table "sponsored_combos", force: :cascade do |t|
    t.bigint "combo_id"
    t.bigint "user_id"
    t.boolean "active_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 10000
    t.jsonb "payment"
    t.string "state"
    t.index ["combo_id"], name: "index_sponsored_combos_on_combo_id"
    t.index ["user_id"], name: "index_sponsored_combos_on_user_id"
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
    t.boolean "guest", default: false
    t.boolean "sponsor_status", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "combos", "movies"
  add_foreign_key "combos", "restaurants"
  add_foreign_key "movies", "genres"
  add_foreign_key "restaurants", "food_types"
  add_foreign_key "sponsored_combos", "combos"
  add_foreign_key "sponsored_combos", "users"
end
