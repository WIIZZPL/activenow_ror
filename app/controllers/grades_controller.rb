class GradesController < ApplicationController
  before_action :set_grade, only: %i[ show edit update destroy ]
  before_action :require_teacher_admin, only: %i[ index show ]
  before_action :require_admin, only: %i[ new edit create update destroy ]

  # GET /grades or /grades.json
  def index
    @grades = Grade.all.includes(:users)
  end

  # GET /grades/1 or /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades or /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grades_path, notice: "Grade was successfully created." }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to grades_path, notice: "Grade was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy

    if @grade.users.count > 0

      redirect_to grades_path, alert: "Cannot destroy a grade with assigned students"
    
    elsif @grade.courses.count > 0

      redirect_to grades_path, alert: "Cannot destroy a grade with assigned courses"
    
    else

      @grade.destroy!

      respond_to do |format|
        format.html { redirect_to grades_path, notice: "Grade was successfully destroyed.", status: :see_other }
        format.json { head :no_content }
      end

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.expect(grade: [ :name, :year ])
    end
end
