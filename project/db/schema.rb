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

ActiveRecord::Schema[7.2].define(version: 2024_12_13_121041) do
  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.decimal "opacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "sales", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "color_id", null: false
    t.integer "type_id", null: false
    t.integer "size_id", null: false
    t.integer "design_id", null: false
    t.index ["color_id"], name: "index_products_on_color_id"
    t.index ["design_id"], name: "index_products_on_design_id"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["type_id"], name: "index_products_on_type_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.integer "rarity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "colors"
  add_foreign_key "products", "designs"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "types"
end
