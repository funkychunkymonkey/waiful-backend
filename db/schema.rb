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

ActiveRecord::Schema.define(version: 2020_03_03_053750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipments_exercises", id: false, force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "equipment_id", null: false
    t.index ["equipment_id", "exercise_id"], name: "index_equipments_exercises_on_equipment_id_and_exercise_id"
    t.index ["exercise_id", "equipment_id"], name: "index_equipments_exercises_on_exercise_id_and_equipment_id"
  end

  create_table "exercise_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exercise_images", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.boolean "is_main"
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_exercise_images_on_exercise_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "exercise_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_category_id"], name: "index_exercises_on_exercise_category_id"
  end

  create_table "exercises_muscles", id: false, force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "muscle_id", null: false
    t.index ["exercise_id", "muscle_id"], name: "index_exercises_muscles_on_exercise_id_and_muscle_id"
    t.index ["muscle_id", "exercise_id"], name: "index_exercises_muscles_on_muscle_id_and_exercise_id"
  end

  create_table "muscles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "runs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "distance", null: false
    t.text "data", null: false
    t.datetime "started_at", null: false
    t.datetime "ended_at"
    t.index ["user_id"], name: "index_runs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.integer "gems"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "exercise_id", null: false
    t.integer "reps"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_workouts_on_exercise_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "exercise_images", "exercises"
  add_foreign_key "exercises", "exercise_categories"
  add_foreign_key "runs", "users"
  add_foreign_key "workouts", "exercises"
  add_foreign_key "workouts", "users"
end
