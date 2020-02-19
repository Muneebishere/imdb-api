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

ActiveRecord::Schema.define(version: 2020_02_19_091940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "celebrities", force: :cascade do |t|
    t.string "full_name"
    t.date "birth_date"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "birth_name"
    t.float "height"
    t.integer "horsescope"
  end

  create_table "celebrity_show_roles", force: :cascade do |t|
    t.bigint "celebrity_id"
    t.integer "role_type"
    t.string "character_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rolable_type"
    t.bigint "rolable_id"
    t.index ["celebrity_id"], name: "index_celebrity_show_roles_on_celebrity_id"
    t.index ["rolable_type", "rolable_id"], name: "index_celebrity_show_roles_on_rolable_type_and_rolable_id"
  end

  create_table "detail_genres", force: :cascade do |t|
    t.bigint "detail_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detail_id"], name: "index_detail_genres_on_detail_id"
    t.index ["genre_id"], name: "index_detail_genres_on_genre_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.bigint "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "film_genres", force: :cascade do |t|
    t.bigint "film_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_genres_on_film_id"
    t.index ["genre_id"], name: "index_film_genres_on_genre_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "media_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "content_rating"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.float "rating"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reviewable_type"
    t.bigint "reviewable_id"
    t.string "heading"
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "film_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.index ["film_id"], name: "index_seasons_on_film_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "show_details", force: :cascade do |t|
    t.string "detailable_type"
    t.bigint "detailable_id"
    t.integer "budget"
    t.integer "duration"
    t.string "title"
    t.float "overall_rating", default: 0.0
    t.date "release_date"
    t.text "plot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detailable_type", "detailable_id"], name: "index_show_details_on_detailable_type_and_detailable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "watchlist_films", force: :cascade do |t|
    t.bigint "watchlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "film_id"
    t.index ["watchlist_id"], name: "index_watchlist_films_on_watchlist_id"
  end

  create_table "watchlist_shows", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "watchlistable_type"
    t.bigint "watchlistable_id"
    t.index ["user_id"], name: "index_watchlist_shows_on_user_id"
    t.index ["watchlistable_id", "watchlistable_type", "user_id"], name: "index_watchlistable_and_user_id", unique: true
    t.index ["watchlistable_type", "watchlistable_id"], name: "index_watchlistable_on_watchlist_show_id"
  end

  create_table "watchlists", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "watchlistable_type"
    t.bigint "watchlistable_id"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
    t.index ["watchlistable_type", "watchlistable_id"], name: "index_watchlists_on_watchlistable_type_and_watchlistable_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "detail_genres", "genres"
  add_foreign_key "detail_genres", "show_details", column: "detail_id"
  add_foreign_key "episodes", "seasons"
  add_foreign_key "film_genres", "films"
  add_foreign_key "film_genres", "genres"
  add_foreign_key "seasons", "films"
  add_foreign_key "watchlist_films", "watchlists"
  add_foreign_key "watchlist_shows", "users"
end
