class Course < ApplicationRecord
  belongs_to :grade
  belongs_to :subject
  belongs_to :teacher, class_name: "User"
  has_many :exams
  has_many :marks

  scope :by_grade, ->(grade_id) {
    where(grade_id: grade_id) if grade_id.present?
  }

  scope :by_subject, ->(subject_id) {
    where(subject_id: subject_id) if subject_id.present?
  }

  def display_name
    "#{grade.name} - #{subject.name}"
  end
end
