class StudentController < ApplicationController
  before_action :require_student

  def dashboard
    @exams = Exam.joins(:course).where(courses: { grade: Current.user.grade })
    @past_exams = @exams.where("date < ?", Date.today)
    @exams = @exams.where("date >= ?", Date.today)

    @courses = Course.where(grade: Current.user.grade)

    @marks = Mark.where(student: Current.user)
  end
end
