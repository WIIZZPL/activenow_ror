module ApplicationHelper
  def admin_only(&block)
    capture(&block) if Current.user&.admin?
  end

  def teacher_or_admin(&block)
    capture(&block) if Current.user&.admin? || Current.user&.teacher?
  end
end
