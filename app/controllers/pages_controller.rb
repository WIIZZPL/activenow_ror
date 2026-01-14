class PagesController < ApplicationController
  allow_unauthenticated_access only: :landing

  def landing
    redirect_to dashboard_path if authenticated?
  end

  def dashboard
    redirect_to admin_root_path if Current.user&.admin?
  end
end