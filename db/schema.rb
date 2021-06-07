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

ActiveRecord::Schema.define(version: 2021_06_07_032328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forward_hooks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "forward_id", null: false
    t.text "body"
    t.text "head"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["forward_id"], name: "index_forward_hooks_on_forward_id"
    t.index ["user_id"], name: "index_forward_hooks_on_user_id"
  end

  create_table "forwards", force: :cascade do |t|
    t.text "local_url"
    t.text "global_url"
    t.bigint "user_id", null: false
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_forwards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.text "api_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "forward_hooks", "forwards"
  add_foreign_key "forward_hooks", "users"
  add_foreign_key "forwards", "users"
end
