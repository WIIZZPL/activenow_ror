class AddGradeToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :grade, null: false, foreign_key: true
  end
end
