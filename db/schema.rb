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

ActiveRecord::Schema[8.1].define(version: 2026_01_15_122215) do
  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "grade_id", null: false
    t.integer "subject_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_courses_on_grade_id"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.date "date"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exams_on_course_id"
  end

  create_table "grades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "year"
  end

  create_table "marks", force: :cascade do |t|
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.string "desc"
    t.integer "exam_id"
    t.integer "student_id", null: false
    t.datetime "updated_at", null: false
    t.integer "value"
    t.index ["course_id"], name: "index_marks_on_course_id"
    t.index ["exam_id"], name: "index_marks_on_exam_id"
    t.index ["student_id"], name: "index_marks_on_student_id"
    t.check_constraint "(1 < value AND value < 6)", name: "mark_value_check"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "desc"
    t.boolean "done"
    t.date "due"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.integer "grade_id"
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.integer "user_type_id", default: 1, null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["grade_id"], name: "index_users_on_grade_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "courses", "grades"
  add_foreign_key "courses", "subjects"
  add_foreign_key "courses", "users", column: "teacher_id"
  add_foreign_key "exams", "courses"
  add_foreign_key "marks", "courses"
  add_foreign_key "marks", "exams"
  add_foreign_key "marks", "users", column: "student_id"
  add_foreign_key "sessions", "users"
  add_foreign_key "users", "grades"
  add_foreign_key "users", "user_types"
end
