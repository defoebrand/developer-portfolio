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

ActiveRecord::Schema.define(version: 2021_02_17_222226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
    t.string "title"
    t.text "description"
    t.string "image"
    t.string "code"
    t.string "mobile_description"
  end

  create_table "apps_stacks", id: false, force: :cascade do |t|
    t.bigint "stack_id", null: false
    t.bigint "app_id", null: false
  end

  create_table "contact_form_submissions", force: :cascade do |t|
    t.string "from_email"
    t.string "subject"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.string "room_token"
    t.string "room_name"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
    t.string "title"
    t.text "description"
    t.string "image"
    t.string "code"
    t.string "mobile_description"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "games_stacks", id: false, force: :cascade do |t|
    t.bigint "stack_id", null: false
    t.bigint "game_id", null: false
  end

  create_table "nav_links", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
    t.string "direction"
    t.boolean "show_signed_out"
  end

  create_table "stacks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color"
  end

  create_table "stacks_websites", id: false, force: :cascade do |t|
    t.bigint "stack_id", null: false
    t.bigint "website_id", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "time_slot"
    t.date "date_slot"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "role"
    t.string "room_token"
    t.string "room_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "websites", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
    t.string "title"
    t.text "description"
    t.string "image"
    t.string "code"
    t.string "mobile_description"
  end

  add_foreign_key "games", "users"
end
