module ApplicationHelper
  def render_created_time(model)
    model.created_at.strftime("%d %b %Y")
  end
end
