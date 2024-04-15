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

ActiveRecord::Schema[7.1].define(version: 2024_04_10_000346) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.string "status"
    t.jsonb "responses", default: []
    t.bigint "psychologist_id", null: false
    t.bigint "evaluatee_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluatee_id"], name: "index_assessments_on_evaluatee_id"
    t.index ["instrument_id"], name: "index_assessments_on_instrument_id"
    t.index ["psychologist_id"], name: "index_assessments_on_psychologist_id"
  end

  create_table "evaluatees", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.date "birthdate"
    t.bigint "psychologist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["psychologist_id"], name: "index_evaluatees_on_psychologist_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.jsonb "questions", default: [], null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "psychologists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_psychologists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_psychologists_on_reset_password_token", unique: true
  end

  add_foreign_key "assessments", "evaluatees"
  add_foreign_key "assessments", "instruments"
  add_foreign_key "assessments", "psychologists"
  add_foreign_key "evaluatees", "psychologists"
end
