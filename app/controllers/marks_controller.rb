class MarksController < ApplicationController
  before_action :require_teacher_admin
  before_action :set_mark, only: %i[ show edit update destroy ]

  # GET /marks or /marks.json
  def index
    @marks = Mark.all
    @marks = @marks.by_student(params[:user_id])
    @marks = @marks.by_grade(params[:grade_id])
    @marks = @marks.by_subject(params[:subject_id])

    @students = User.joins(:user_type).where(user_types: { name: "student" })
    @grades = Grade.all
    @subjects = Subject.all

    if Current.user&.teacher?
      @marks = @marks.joins(:course).where(courses: { teacher_id: Current.user.id })
      @students = @marks.map(&:student).uniq
      @grades = @grades.joins(:courses).where(courses: { teacher_id: Current.user.id }).distinct
      @subjects = @subjects.joins(:courses).where(courses: { teacher_id: Current.user.id }).distinct
    end
  end

  # GET /marks/1 or /marks/1.json
  def show
  end

  # GET /marks/new
  def new
    @mark = Mark.new
    
    @students = User.joins(:user_type).where(user_types: { name: "student" })
    @courses = Course.all
    @exams = Exam.all

    if Current.user&.teacher?
      @courses = @courses.where(teacher_id: Current.user.id)
      @exams = @exams.joins(:course).where(courses: { teacher_id: Current.user.id }).distinct
    end
  end

  # GET /marks/1/edit
  def edit
    @exams = Exam.all

    if Current.user&.teacher?
      @exams = @exams.joins(:course).where(courses: { teacher_id: Current.user.id }).distinct
    end
  end

  # POST /marks or /marks.json
  def create
    @mark = Mark.new(mark_params)

    respond_to do |format|
      if @mark.save
        format.html { redirect_to marks_path, notice: "Mark was successfully created." }
        format.json { render :show, status: :created, location: @mark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marks/1 or /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to marks_path, notice: "Mark was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1 or /marks/1.json
  def destroy
    @mark.destroy!

    respond_to do |format|
      format.html { redirect_to marks_path, notice: "Mark was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mark_params
      params.expect(mark: [ :value, :desc, :course_id, :exam_id, :student_id, :grade_id, :subject_id ])
    end
end
