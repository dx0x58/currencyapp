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

end
