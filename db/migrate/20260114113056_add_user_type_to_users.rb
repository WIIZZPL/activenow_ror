class AddUserTypeToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :user_type, null: false, foreign_key: true, default: 1
  end
end
