class OrdersController < ApplicationController

  def new
    @order = current_user.orders.new
    @order.build_order_detail
  end

  def create
    @cart = current_cart
    @order = current_user.orders.new(order_params)
    if @order.save
      reset_cart
    else
      render :new
      flash[:warning] = "訂單新增失敗"
    end
    redirect_to root_path
  end


  protected

  def order_params
    params.require(:order).permit(order_detail_attributes: [:id, :billing_name, :billing_phone_number, :billing_address,
                                   :shipping_name, :shipping_phone_number, :shipping_address])
  end

end
