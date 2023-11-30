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

ActiveRecord::Schema[7.1].define(version: 2023_11_30_120630) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercices", force: :cascade do |t|
    t.string "name"
    t.bigint "sport_id", null: false
    t.bigint "metric_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_id"], name: "index_exercices_on_metric_id"
    t.index ["sport_id"], name: "index_exercices_on_sport_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.integer "duration"
    t.integer "average_speed"
    t.integer "repetition"
    t.integer "serie"
    t.integer "weight"
    t.time "breack_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seances", force: :cascade do |t|
    t.date "date"
    t.bigint "training_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.integer "rating"
    t.time "duration"
    t.index ["training_id"], name: "index_seances_on_training_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_exercices", force: :cascade do |t|
    t.bigint "training_id", null: false
    t.bigint "exercice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercice_id"], name: "index_training_exercices_on_exercice_id"
    t.index ["training_id"], name: "index_training_exercices_on_training_id"
  end

  create_table "training_metrics", force: :cascade do |t|
    t.bigint "training_exercice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_exercice_id"], name: "index_training_metrics_on_training_exercice_id"
  end

  create_table "training_values", force: :cascade do |t|
    t.bigint "training_metric_id", null: false
    t.bigint "seance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seance_id"], name: "index_training_values_on_seance_id"
    t.index ["training_metric_id"], name: "index_training_values_on_training_metric_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.bigint "user_sport_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_sport_id"], name: "index_trainings_on_user_sport_id"
  end

  create_table "user_sports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_user_sports_on_sport_id"
    t.index ["user_id"], name: "index_user_sports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nick_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exercices", "metrics"
  add_foreign_key "exercices", "sports"
  add_foreign_key "seances", "trainings"
  add_foreign_key "training_exercices", "exercices"
  add_foreign_key "training_exercices", "trainings"
  add_foreign_key "training_metrics", "training_exercices"
  add_foreign_key "training_values", "seances"
  add_foreign_key "training_values", "training_metrics"
  add_foreign_key "trainings", "user_sports"
  add_foreign_key "user_sports", "sports"
  add_foreign_key "user_sports", "users"
end
