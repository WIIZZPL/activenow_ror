class Grade < ApplicationRecord
  has_many :users, dependent: :restrict_with_exception
  has_many :courses, dependent: :restrict_with_exception
end
