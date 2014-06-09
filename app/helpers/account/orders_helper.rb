module Account::OrdersHelper
  def render_order_status(order)
    if order.paid
      render :partial => "order_compelete"
    else
      render :partial => "order_pending"
    end
  end
end
