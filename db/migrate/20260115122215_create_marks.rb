class CreateMarks < ActiveRecord::Migration[8.1]
  def change
    create_table :marks do |t|
      t.integer :value
      t.string :desc
      t.references :course, null: false, foreign_key: true
      t.references :exam, null: true, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_check_constraint :marks, "(2 <= value AND value <= 5)", name: "mark_value_check"
  end
end
