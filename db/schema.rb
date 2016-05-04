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

ActiveRecord::Schema.define(version: 20160504183004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "unaccent"
  enable_extension "citext"
  enable_extension "pgcrypto"

  create_table "alarms", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.integer  "code",        limit: 2, null: false
    t.citext   "name",                  null: false
    t.string   "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "alarms", ["name"], name: "index_alarms_on_name", using: :btree

  create_table "companies", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "name",                      null: false
    t.citext   "subdomain",                 null: false
    t.boolean  "public",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "configs", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.citext   "name"
    t.jsonb    "content",    default: {}, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "configs", ["content"], name: "index_configs_on_content", using: :gin
  add_index "configs", ["name"], name: "index_configs_on_name", using: :btree

  create_table "firmwares", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.citext   "name",       null: false
    t.citext   "path",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "firmwares", ["name"], name: "index_firmwares_on_name", using: :btree
  add_index "firmwares", ["path"], name: "index_firmwares_on_path", using: :btree

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

  create_table "lamp_stats", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.integer  "serial_number",  limit: 8,  null: false
    t.integer  "sentPkts",       limit: 8
    t.integer  "rcvPkts",        limit: 8
    t.integer  "lastReboot",     limit: 8
    t.integer  "ctrlRestart",    limit: 8
    t.integer  "rssiDev",        limit: 2
    t.integer  "lqiDev",         limit: 2
    t.integer  "correlationDev", limit: 2
    t.integer  "rssi",           limit: 2
    t.integer  "lqi",            limit: 2
    t.integer  "correlation",    limit: 2
    t.integer  "txPwr",          limit: 2
    t.integer  "vFirmware",      limit: 2
    t.integer  "power",          limit: 2
    t.integer  "sLum"
    t.integer  "vCmd"
    t.integer  "cksCfg"
    t.integer  "appCksErr"
    t.integer  "cmdNotImp"
    t.float    "current"
    t.float    "volt"
    t.float    "tCom"
    t.float    "tLed1"
    t.float    "tLed2"
    t.boolean  "online"
    t.boolean  "communicating"
    t.datetime "date"
    t.string   "sunrise",        limit: 25
    t.string   "sunset",         limit: 25
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "lamp_stats", ["serial_number"], name: "index_lamp_stats_on_serial_number", using: :btree

  create_table "networks", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.citext   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "networks", ["name"], name: "index_networks_on_name", using: :btree

  create_table "nodes", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.citext    "name",                                                                              null: false
    t.geography "location",   limit: {:srid=>4326, :type=>"point", :has_z=>true, :geographic=>true}
    t.uuid      "network_id"
    t.datetime  "created_at",                                                                        null: false
    t.datetime  "updated_at",                                                                        null: false
  end

  add_index "nodes", ["location"], name: "index_nodes_on_location", using: :gist
  add_index "nodes", ["name"], name: "index_nodes_on_name", using: :btree
  add_index "nodes", ["network_id"], name: "index_nodes_on_network_id", using: :btree

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
    t.citext "name", null: false
  end

  create_table "roles", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.citext   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.datetime "execute_at",                            null: false
    t.integer  "code",            limit: 2
    t.integer  "status",                    default: 0
    t.string   "description"
    t.uuid     "node_id"
    t.uuid     "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "tasks", ["attachable_type", "attachable_id"], name: "index_tasks_on_attachable_type_and_attachable_id", using: :btree
  add_index "tasks", ["node_id"], name: "index_tasks_on_node_id", using: :btree

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
  add_foreign_key "nodes", "networks"
  add_foreign_key "permissions", "roles"
  add_foreign_key "tasks", "nodes"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users_companies", "companies"
  add_foreign_key "users_companies", "users"
end
