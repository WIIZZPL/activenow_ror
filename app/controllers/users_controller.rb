class UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "Account created"
    else
      render :new, status: :unprocessable_entity
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
    params.require(:user).permit(:email_address, :password, :password_confirmation, :user_type_id)
  end

  def set_user
    @user = User.find(params.expect(:id))
  end
end
