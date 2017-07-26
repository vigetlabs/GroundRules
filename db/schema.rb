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

ActiveRecord::Schema.define(version: 20170726203902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "device_problems", force: :cascade do |t|
    t.string "statement", null: false
    t.json "content", null: false
    t.integer "device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", null: false
    t.index ["name"], name: "index_devices_on_name", unique: true
  end

  create_table "photo_attachments", force: :cascade do |t|
    t.bigint "photo_id", null: false
    t.string "attachable_type", null: false
    t.bigint "attachable_id", null: false
    t.string "attachable_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_photo_attachments_on_attachable_type_and_attachable_id"
    t.index ["photo_id", "attachable_id", "attachable_type", "attachable_name"], name: "index_photo_attachments_on_attachable_fields", unique: true
    t.index ["photo_id"], name: "index_photo_attachments_on_photo_id"
  end

  create_table "photo_croppings", force: :cascade do |t|
    t.bigint "photo_id", null: false
    t.string "signature", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_photo_croppings_on_photo_id"
    t.index ["signature"], name: "index_photo_croppings_on_signature", unique: true
  end

  create_table "photos", force: :cascade do |t|
    t.string "name", null: false
    t.string "image_uid", null: false
    t.string "image_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roast_brands", force: :cascade do |t|
    t.string "brand_name", null: false
    t.string "roast_name", null: false
    t.integer "roast_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", null: false
    t.index ["roast_id"], name: "index_roast_brands_on_roast_id"
  end

  create_table "roasts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description", null: false
    t.text "sub_description", null: false
    t.integer "position", null: false
    t.index ["name"], name: "index_roasts_on_name", unique: true
  end

  add_foreign_key "device_problems", "devices"
  add_foreign_key "photo_attachments", "photos", on_delete: :cascade
  add_foreign_key "photo_croppings", "photos", on_delete: :cascade
  add_foreign_key "roast_brands", "roasts"
end
