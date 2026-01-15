class Exam < ApplicationRecord
  belongs_to :course
  has_many :marks

  scope :by_grade, ->(grade_id) {
    joins(course: :grade)
    .where(grades: {id: grade_id}) if grade_id.present?
  }

  scope :by_subject, ->(subject_id) {
    joins(course: :subject)
    .where(subjects: {id: subject_id}) if subject_id.present?
  }

  def display_name
    "#{course.display_name} - #{self.title}"
  end
end
