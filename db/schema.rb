# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160427180702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "unaccent"
  enable_extension "citext"
  enable_extension "pgcrypto"

  create_table "companies", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "subdomain",                 null: false
    t.boolean  "public",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "gateway_roles", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.uuid     "gateway_id", null: false
    t.uuid     "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "gateway_roles", ["gateway_id"], name: "index_gateway_roles_on_gateway_id", using: :btree
  add_index "gateway_roles", ["role_id"], name: "index_gateway_roles_on_role_id", using: :btree

  create_table "gateways", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.boolean  "authorized",         default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "provider",           default: "email", null: false
    t.string   "uid",                default: "",      null: false
    t.string   "encrypted_password", default: "",      null: false
    t.integer  "sign_in_count",      default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email"
    t.text     "tokens"
  end

  add_index "gateways", ["email"], name: "index_gateways_on_email", using: :btree
  add_index "gateways", ["uid", "provider"], name: "index_gateways_on_uid_and_provider", unique: true, using: :btree

  create_table "permissions", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.integer  "ability",           limit: 2, default: 0, null: false
    t.uuid     "resourceable_id"
    t.string   "resourceable_type"
    t.uuid     "role_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "permissions", ["resourceable_type", "resourceable_id"], name: "index_permissions_on_resourceable_type_and_resourceable_id", using: :btree
  add_index "permissions", ["role_id"], name: "index_permissions_on_role_id", using: :btree

  create_table "resources", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.citext "name"
  end

  create_table "roles", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.citext   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.uuid     "user_id",    null: false
    t.uuid     "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.citext   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.citext   "username"
    t.citext   "email",                                    null: false
    t.string   "full_name"
    t.string   "image"
    t.jsonb    "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider", "username", "email"], name: "index_users_on_uid_and_provider_and_username_and_email", unique: true, using: :btree

  create_table "users_companies", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "company_id"
    t.boolean  "accepted",   default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "users_companies", ["company_id"], name: "index_users_companies_on_company_id", using: :btree
  add_index "users_companies", ["user_id"], name: "index_users_companies_on_user_id", using: :btree

  add_foreign_key "gateway_roles", "gateways"
  add_foreign_key "gateway_roles", "roles"
  add_foreign_key "permissions", "roles"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users_companies", "companies"
  add_foreign_key "users_companies", "users"
end
