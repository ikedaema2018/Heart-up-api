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

ActiveRecord::Schema.define(version: 20181003080604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "closer_alerts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "locate_info_id"
    t.boolean "close_flag", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "first_locates", force: :cascade do |t|
    t.integer "locate_info_id"
    t.integer "user_id"
    t.float "ido"
    t.float "keido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locate_infos", force: :cascade do |t|
    t.string "nayami"
    t.float "ido"
    t.float "keido"
    t.integer "user_id"
    t.string "color"
    t.boolean "life_flag", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nayami_comments", force: :cascade do |t|
    t.string "nayami_comment"
    t.integer "locate_info_id"
    t.integer "user_id"
    t.boolean "yonda_flag", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "push_infos", force: :cascade do |t|
    t.integer "user_id"
    t.string "fcm_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repry_comments", force: :cascade do |t|
    t.string "comment"
    t.integer "stamp_id"
    t.integer "user_id"
    t.integer "nayami_comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shabon_alerts", force: :cascade do |t|
    t.integer "locate_info_id"
    t.boolean "splash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "splash_yonda_checks", force: :cascade do |t|
    t.string "locate_info_id"
    t.boolean "yonda_flag", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "target_users", force: :cascade do |t|
    t.integer "locate_info_id"
    t.integer "user_id"
    t.boolean "life_flag", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_locates", force: :cascade do |t|
    t.integer "user_id"
    t.float "ido"
    t.float "keido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
    t.string "gender"
    t.string "self_introduce"
    t.string "profile_image"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
