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

ActiveRecord::Schema[8.1].define(version: 2025_11_07_020055) do
  create_table "accounts", force: :cascade do |t|
    t.string "code", limit: 20, null: false
    t.datetime "created_at", null: false
    t.string "mood", limit: 8, default: "none", null: false
    t.string "name", limit: 100, null: false
    t.datetime "updated_at", null: false
    t.string "uuid", limit: 36, null: false
    t.index ["code"], name: "index_accounts_on_code", unique: true
    t.index ["mood"], name: "index_accounts_on_mood"
    t.index ["uuid"], name: "index_accounts_on_uuid", unique: true
  end

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "message_checksum", null: false
    t.string "message_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "code", null: false
    t.text "content", limit: 16777215
    t.datetime "created_at", null: false
    t.string "do", default: "do", null: false
    t.datetime "done_at"
    t.datetime "fade_at"
    t.datetime "fade_to"
    t.integer "fire", default: 0, null: false
    t.integer "foos", default: 0, null: false
    t.integer "load", default: 0, null: false
    t.integer "mass", default: 0, null: false
    t.string "mood", default: "none", null: false
    t.datetime "must_at"
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.string "uuid", null: false
    t.index ["account_id", "code"], name: "index_items_on_account_id_and_code", unique: true
    t.index ["account_id", "do"], name: "index_items_on_account_id_and_do"
    t.index ["account_id", "done_at"], name: "index_items_on_account_id_and_done_at"
    t.index ["account_id", "mood"], name: "index_items_on_account_id_and_mood"
    t.index ["account_id", "must_at"], name: "index_items_on_account_id_and_must_at"
    t.index ["account_id", "uuid"], name: "index_items_on_account_id_and_uuid", unique: true
    t.index ["account_id"], name: "index_items_on_account_id"
    t.index ["code"], name: "index_items_on_code", unique: true
    t.index ["do"], name: "index_items_on_do"
    t.index ["mood"], name: "index_items_on_mood"
    t.index ["name"], name: "index_items_on_name"
    t.index ["uuid"], name: "index_items_on_uuid", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "items", "accounts"
end
