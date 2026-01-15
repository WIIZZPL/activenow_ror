class ExamsController < ApplicationController
  before_action :require_teacher_admin
  before_action :set_exam, only: %i[ show edit update destroy ]

  # GET /exams or /exams.json
  def index
    @exams = Exam.all
    @exams = @exams.by_grade(params[:grade_id])
    @exams = @exams.by_subject(params[:subject_id])

    @grades = Grade.all
    @subjects = Subject.all

    if Current.user&.teacher?
      @exams = @exams.joins(:course).where(courses: { teacher_id: Current.user.id })
      @grades = @grades.joins(:courses).where(courses: { teacher_id: Current.user.id }).distinct
      @subjects = @subjects.joins(:courses).where(courses: { teacher_id: Current.user.id }).distinct
    end

    @past_exams = @exams.where("date < ?", Date.today)
    @exams = @exams.where("date >= ?", Date.today)
  end

  # GET /exams/1 or /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new

    @courses = Course.all

    if Current.user&.teacher?
      @courses = Course.where(teacher_id: Current.user.id)
    end
  end

  # GET /exams/1/edit
  def edit
    @courses = Course.all

    if Current.user&.teacher?
      @courses = Course.where(teacher_id: Current.user.id)
    end
  end

  # POST /exams or /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to exams_path, notice: "Exam was successfully created." }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to exams_path, notice: "Exam was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @exam.destroy!

    respond_to do |format|
      format.html { redirect_to exams_path, notice: "Exam was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.expect(exam: [ :title, :date, :course_id, :grade_id, :subject_id ])
    end
end
