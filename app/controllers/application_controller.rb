class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def require_admin
    unless Current.user&.admin?
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  def require_teacher
    unless Current.user&.teacher?
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  def require_student
    unless Current.user&.student?
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  def require_teacher_admin
    unless Current.user&.teacher? || Current.user&.admin?
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end
end
