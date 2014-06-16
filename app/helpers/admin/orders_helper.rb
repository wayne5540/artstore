module Admin::OrdersHelper

  def render_next_status_path(order)
    button_to("next-status", next_status_admin_order_path(order), :class => "btn btn-xs btn-default")
  end

  def render_order_user_name(order)
    order.user.name
  end

  def render_order_status(order)
    order.status
  end

  def render_order_payment(order)
    order.payment
  end
  
end
