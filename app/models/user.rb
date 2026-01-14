class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  belongs_to :user_type

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def admin?
    user_type.name = 'admin'
  end

  def teacher?
    user_type.name = 'teacher'
  end

  def student?
    user_type.name = 'student'
  end
end
