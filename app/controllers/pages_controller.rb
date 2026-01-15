class PagesController < ApplicationController
  allow_unauthenticated_access only: :landing

  def landing
    redirect_to dashboard_path if authenticated?
  end

  def dashboard
    redirect_to admin_root_path if Current.user&.admin?
    redirect_to teacher_root_path if Current.user&.teacher?
    redirect_to student_root_path if Current.user&.student?
  end
end