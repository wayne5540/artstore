module Account::OrdersHelper

  def render_order_status(order)
    if order.paid
      render :partial => "order_compelete"
    else
      render :partial => "order_pending"
    end
  end

  def render_credit_card_pay_path
    button_to("信用卡結賬", pay_account_order_path(payment_type: "credit_card"), :class => "btn btn-success" ) 
  end

  def render_order_total(order)
    order.total
  end

  def render_order_item_product_name(item)
    item.product.name
  end

  def render_order_item_product_price(item)
    item.product.price
  end

  def render_order_item_spec_name(item)
    item.spec.name
  end


  # order_detail relations

  def render_order_detail_billing_name(order)
    order.order_detail.billing_name
  end

  def render_order_detail_billing_address(order)
    order.order_detail.billing_address
  end

  def render_order_detail_billing_phone_number(order)
    order.order_detail.billing_phone_number
  end

  def render_order_detail_shipping_name(order)
    order.order_detail.shipping_name
  end

  def render_order_detail_shipping_address(order)
    order.order_detail.shipping_address
  end

  def render_order_detail_shipping_phone_number(order)
    order.order_detail.shipping_phone_number
  end



end
