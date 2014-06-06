class OrdersController < ApplicationController

  before_action :login_required
  before_action :find_order, only: [:show]
  before_action :auth_user, only: [:show]

  def show
    @items = @order.items.includes(:product, :spec)
    @detail = @order.order_detail
  end


  def new
    @order = current_user.orders.new
    @order.build_order_detail
  end

  def create
    @cart = current_cart
    @new_order = current_user.orders.new(order_params)
    @order = OrderCreater.new(@new_order, @cart.items)
    if @order.process
      reset_cart
      flash[:success] = "成功新增訂單"
      redirect_to order_path(@new_order)
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

  def find_order
    @order = Order.find(params[:id])
  end

  def auth_user
    @order.user == current_user
  end

end
