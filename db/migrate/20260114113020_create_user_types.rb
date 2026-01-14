class CreateUserTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :user_types do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
