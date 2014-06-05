class OrdersController < ApplicationController

  def new
    @order = current_user.orders.new
    @order.build_order_detail
  end

  def create
    @cart = current_cart
    @order = current_user.orders.new(order_params)
    reset_cart
    @order.save
    redirect_to root_path
  end


  protected

  def order_params
    params.require(:order).permit(order_detail_attributes: [:id, :billing_name, :billing_phone_number, :billing_address,
                                   :shipping_name, :shipping_phone_number, :shipping_address])
  end

end
