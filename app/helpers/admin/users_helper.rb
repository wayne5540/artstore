module Admin::UsersHelper
  def render_user_name(user)
    user.name
  end
  def render_user_email(user)
    user.email
  end
  def render_edit_user_path(user)
    link_to("管理會員", edit_admin_user_path(user))
  end
end
