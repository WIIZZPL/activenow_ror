class Mark < ApplicationRecord
  belongs_to :course
  belongs_to :exam, optional: true
  belongs_to :student, class_name: "User"
  
  validate :student_belongs_to_course
  validate :exam_belongs_to_course
  validate :value_in_range

  scope :by_student, ->(student_id) {
    where(student_id: student_id) if student_id.present?
  }

  scope :by_grade, ->(grade_id) {
    joins(course: :grade)
    .where(grades: {id: grade_id}) if grade_id.present?
  }

  scope :by_subject, ->(subject_id) {
    joins(course: :subject)
    .where(subjects: {id: subject_id}) if subject_id.present?
  }

  def full_description
    if exam.present? && desc.empty?
      "#{exam.title} exam"
    elsif exam.present?
      "#{desc} - #{exam.title}"
    else
      desc
    end
  end

  private
  
  def student_belongs_to_course
    return if student.blank? || course.blank?

    if student.grade != course.grade
      errors.add(:course_id, "does not belong to the selected student")
    end
  end

  def exam_belongs_to_course
    return unless exam.present? || course.blank?

    if exam.course != course
      errors.add(:exam_id, "does not belong to the selected course")
    end
  end

  def value_in_range
    return unless value.present?

    unless 2 <= value && value <= 5
      errors.add(:value, "is not in range from 2 to 5")
    end
  end
end
