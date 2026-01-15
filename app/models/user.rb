class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  belongs_to :user_type

  belongs_to :grade, optional: true
  has_many :courses, foreign_key: "teacher_id", dependent: :restrict_with_exception

  has_many :marks, foreign_key: "student_id", dependent: :destroy

  validate :role_validation

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def admin?
    user_type.name == 'admin'
  end

  def teacher?
    user_type.name == 'teacher'
  end

  def student?
    user_type.name == 'student'
  end

  def gpa
    marks.average(:value).round(2) if student?
  end

  scope :by_grade, ->(grade_id) {
    where(grade_id: grade_id) if grade_id.present?
  }

  scope :by_type, ->(user_type_id) {
    where(user_type_id: user_type_id) if user_type_id.present?
  }

  private

  def role_validation
    case user_type.name
    when 'admin'
      errors.add(:grade, "Admins can't be in a grade") if grade.present?
      errors.add(:courses, "Admin can't be teaching a course") if courses.any?
      errors.add(:courses, "Admin can't be assgined a mark") if marks.any?
    when 'teacher'
      errors.add(:grade, "Teachers can't be in a grade") if grade.present?
      errors.add(:courses, "Teachers can't be assgined a mark") if marks.any?
    when 'student'
      errors.add(:courses, "Students can't be teaching a course") if courses.any?
    else
      errors.add(:user_type, "User type is invalid")
    end
  end
end
