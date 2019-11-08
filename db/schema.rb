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

ActiveRecord::Schema.define(version: 2019_11_08_211045) do

  create_table "properties", force: :cascade do |t|
    t.integer "property_type_id"
    t.decimal "base_price", precision: 10, scale: 2
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "property_records", force: :cascade do |t|
    t.integer "property_id"
    t.decimal "dynamic_display_price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_property_records_on_property_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "properties", "property_types"
  add_foreign_key "property_records", "properties"
end
