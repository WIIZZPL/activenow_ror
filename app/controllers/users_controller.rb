class UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: [:destroy, :edit, :update]

  def index
    @users = User.all

    @users = @users.by_grade(params[:grade_id])

    @users = @users.by_type(params[:user_type_id])
  end

  def students
    @students = User.joins(:user_type).where(user_types: { name: "student" })
    @students = @students.by_grade(params[:grade_id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "Account created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to students_users_path, notice: "User was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation, :user_type_id, :grade_id)
  end

  def set_user
    @user = User.find(params.expect(:id))
  end
end
