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

ActiveRecord::Schema.define(version: 2018_07_28_171813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_partman"
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "create_index_statement", unique: true, where: "active"
  end

  create_table "currencies_p2018w26", id: :bigint, default: -> { "nextval('currencies_id_seq'::regclass)" }, force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies_p2018w27", id: :bigint, default: -> { "nextval('currencies_id_seq'::regclass)" }, force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies_p2018w28", id: :bigint, default: -> { "nextval('currencies_id_seq'::regclass)" }, force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies_p2018w29", id: :bigint, default: -> { "nextval('currencies_id_seq'::regclass)" }, force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies_p2018w30", id: :bigint, default: -> { "nextval('currencies_id_seq'::regclass)" }, force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies_p2018w31", id: :bigint, default: -> { "nextval('currencies_id_seq'::regclass)" }, force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies_p2018w32", id: :bigint, default: -> { "nextval('currencies_id_seq'::regclass)" }, force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies_p2018w33", id: :bigint, default: -> { "nextval('currencies_id_seq'::regclass)" }, force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies_p2018w34", id: :bigint, default: -> { "nextval('currencies_id_seq'::regclass)" }, force: :cascade do |t|
    t.decimal "value", precision: 7, scale: 4, null: false
    t.datetime "expiration_date"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_time_partitions", primary_key: ["parent_table", "child_table"], force: :cascade do |t|
    t.text "parent_table", null: false
    t.text "child_table", null: false
    t.tstzrange "partition_range", null: false
    t.index ["partition_range"], name: "custom_time_partitions_partition_range_idx", using: :gist
  end

  create_table "part_config", primary_key: "parent_table", id: :text, force: :cascade do |t|
    t.text "control", null: false
    t.text "partition_type", null: false
    t.text "partition_interval", null: false
    t.text "constraint_cols", array: true
    t.integer "premake", default: 4, null: false
    t.integer "optimize_trigger", default: 4, null: false
    t.integer "optimize_constraint", default: 30, null: false
    t.text "epoch", default: "none", null: false
    t.boolean "inherit_fk", default: true, null: false
    t.text "retention"
    t.text "retention_schema"
    t.boolean "retention_keep_table", default: true, null: false
    t.boolean "retention_keep_index", default: true, null: false
    t.boolean "infinite_time_partitions", default: false, null: false
    t.text "datetime_string"
    t.text "automatic_maintenance", default: "on", null: false
    t.boolean "jobmon", default: true, null: false
    t.boolean "sub_partition_set_full", default: false, null: false
    t.boolean "undo_in_progress", default: false, null: false
    t.boolean "trigger_exception_handling", default: false
    t.text "upsert", default: "", null: false
    t.boolean "trigger_return_null", default: true, null: false
    t.text "template_table"
    t.index ["partition_type"], name: "part_config_type_idx"
  end

  create_table "part_config_sub", primary_key: "sub_parent", id: :text, force: :cascade do |t|
    t.text "sub_partition_type", null: false
    t.text "sub_control", null: false
    t.text "sub_partition_interval", null: false
    t.text "sub_constraint_cols", array: true
    t.integer "sub_premake", default: 4, null: false
    t.integer "sub_optimize_trigger", default: 4, null: false
    t.integer "sub_optimize_constraint", default: 30, null: false
    t.text "sub_epoch", default: "none", null: false
    t.boolean "sub_inherit_fk", default: true, null: false
    t.text "sub_retention"
    t.text "sub_retention_schema"
    t.boolean "sub_retention_keep_table", default: true, null: false
    t.boolean "sub_retention_keep_index", default: true, null: false
    t.boolean "sub_infinite_time_partitions", default: false, null: false
    t.text "sub_automatic_maintenance", default: "on", null: false
    t.boolean "sub_jobmon", default: true, null: false
    t.boolean "sub_trigger_exception_handling", default: false
    t.text "sub_upsert", default: "", null: false
    t.boolean "sub_trigger_return_null", default: true, null: false
    t.text "sub_template_table"
  end

  add_foreign_key "part_config_sub", "part_config", column: "sub_parent", primary_key: "parent_table", name: "part_config_sub_sub_parent_fkey", on_update: :cascade, on_delete: :cascade
end
