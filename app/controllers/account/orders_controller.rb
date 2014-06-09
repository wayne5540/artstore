class Account::OrdersController < ApplicationController

  before_action :login_required
  before_action :find_order, only: [:show, :pay]

  def index
    @orders = current_user.orders
  end

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
      redirect_to account_order_path(@new_order)
    else
      render :new
      flash[:warning] = "訂單新增失敗"
    end
  end

  def pay
    case params[:payment_type]
    when "credit_card"
      credit_card_process
    else
      redirect_to root_path  
      flash[:warning] = "Hey, are you kidding me? 請選擇正常的付款方式"
    end
  end


  protected

  def order_params
    params.require(:order).permit(order_detail_attributes: [:id, :billing_name, :billing_phone_number, :billing_address,
                                   :shipping_name, :shipping_phone_number, :shipping_address])
  end

  def find_order
    @order = current_user.orders.find(params[:id])
  end

  def credit_card_process
    @order.pay_by_credit_card
    redirect_to account_order_path(@order)
    flash[:success] = "付款成功，You Good!"
    #mail_to_admin
    AdminMailer.order_compelete_notification(@order).deliver
    #mail_to_user(user)
    OrderMailer.compelete_notification(@order, @order.user.email).deliver
  end


end
