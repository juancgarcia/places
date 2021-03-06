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

ActiveRecord::Schema.define(version: 20170807175402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_text"
  end

  create_table "guesses", force: :cascade do |t|
    t.string "guess_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.integer "score", default: 0
    t.bigint "user_id"
    t.index ["post_id"], name: "index_guesses_on_post_id"
    t.index ["user_id"], name: "index_guesses_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "place_photo_url"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "place_id"
    t.index ["place_id"], name: "index_posts_on_place_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_tags_on_category_id"
    t.index ["post_id"], name: "index_tags_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "guesses", "posts"
  add_foreign_key "guesses", "users"
  add_foreign_key "posts", "places"
  add_foreign_key "tags", "categories"
  add_foreign_key "tags", "posts"
end
