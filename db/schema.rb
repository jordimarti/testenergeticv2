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

ActiveRecord::Schema.define(version: 2018_10_14_154326) do

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

  create_table "edificis", force: :cascade do |t|
    t.integer "user_id"
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entitats", force: :cascade do |t|
    t.integer "edifici_id"
    t.string "nom"
    t.text "descripcio"
    t.decimal "superficie"
    t.string "destinacio"
    t.decimal "quota"
    t.string "nom_propietari"
    t.string "cognoms_propietari"
    t.string "email_propietari"
    t.string "telefon_propietari"
    t.string "adreca_propietari"
    t.string "codi_postal_propietari"
    t.string "municipi_propietari"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identificacions", force: :cascade do |t|
    t.integer "edifici_id"
    t.string "tipus_via"
    t.string "nom_via"
    t.string "numero_via"
    t.string "bloc"
    t.integer "codi_postal"
    t.string "poblacio"
    t.string "provincia"
    t.integer "any_construccio"
    t.decimal "superficie_util"
    t.string "nom_propietari"
    t.string "cognoms_propietari"
    t.string "tipus_document_identitat_propietari"
    t.string "numero_document_identitat_propietari"
    t.string "email_propietari"
    t.string "telefon_propietari"
    t.string "adreca_propietari"
    t.string "codi_postal_propietari"
    t.string "municipi_propietari"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
