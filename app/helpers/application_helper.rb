module ApplicationHelper
  def logged_user(user = current_user)
    Admin.find_by_iduff(user.iduff)
  end
end
