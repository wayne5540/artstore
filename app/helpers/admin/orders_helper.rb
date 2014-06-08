module Admin::OrdersHelper

  def render_next_status_path(order)
    button_to("next-status", next_status_admin_order_path(order), :class => "btn btn-xs btn-default")
  end
end
