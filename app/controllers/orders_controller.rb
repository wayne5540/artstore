class OrdersController < ApplicationController

  def new
    @order = current_user.orders.new
    @order.build_order_detail
  end

  def create
    @cart = current_cart
    @order1 = current_user.orders.new(order_params)
    @order = OrderCreater.new(@order1, @cart.items)
    if @order.process
      reset_cart
      flash[:success] = "成功新增訂單"
      redirect_to root_path
    else
      render :new
      flash[:warning] = "訂單新增失敗"
    end
  end


  protected

  def order_params
    params.require(:order).permit(order_detail_attributes: [:id, :billing_name, :billing_phone_number, :billing_address,
                                   :shipping_name, :shipping_phone_number, :shipping_address])
  end

end
