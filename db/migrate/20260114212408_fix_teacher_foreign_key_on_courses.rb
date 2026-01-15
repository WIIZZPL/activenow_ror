class FixTeacherForeignKeyOnCourses < ActiveRecord::Migration[8.1]
  def change

    remove_foreign_key :courses, column: :teacher_id

    add_foreign_key :courses, :users, column: :teacher_id

  end
end
