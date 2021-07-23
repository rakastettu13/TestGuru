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

ActiveRecord::Schema.define(version: 2021_07_21_235401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "body", null: false
    t.boolean "correct", default: false, null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "badge_owners", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "badge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id"], name: "index_badge_owners_on_badge_id"
    t.index ["user_id"], name: "index_badge_owners_on_user_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.string "rule", null: false
    t.string "rule_value"
    t.string "image_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_badges_on_title", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_gists_on_question_id"
    t.index ["user_id"], name: "index_gists_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "body", null: false
    t.bigint "test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "test_takers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "current_question_id"
    t.integer "current_question_number", default: 0, null: false
    t.integer "correct_questions", default: 0, null: false
    t.boolean "successfully"
    t.index ["current_question_id"], name: "index_test_takers_on_current_question_id"
    t.index ["test_id"], name: "index_test_takers_on_test_id"
    t.index ["user_id"], name: "index_test_takers_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level", default: 0, null: false
    t.bigint "category_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "time_limit"
    t.index ["author_id"], name: "index_tests_on_author_id"
    t.index ["category_id"], name: "index_tests_on_category_id"
    t.index ["title", "level"], name: "index_tests_on_title_and_level", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "type", default: "User", null: false
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "badge_owners", "badges"
  add_foreign_key "badge_owners", "users"
  add_foreign_key "gists", "questions"
  add_foreign_key "gists", "users"
  add_foreign_key "questions", "tests"
  add_foreign_key "test_takers", "questions", column: "current_question_id"
  add_foreign_key "test_takers", "tests"
  add_foreign_key "test_takers", "users"
  add_foreign_key "tests", "categories"
  add_foreign_key "tests", "users", column: "author_id"
end
