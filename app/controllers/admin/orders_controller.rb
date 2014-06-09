class Admin::OrdersController < ApplicationController

  before_action :login_required
  before_action :admin_required
  before_action :find_order, :only => [:next_status]

  def index
    @orders = Order.includes(:items).recent
    @unpaid_orders = @orders.unpaid
    @paid_orders = @orders.paid
    @shipping_orders = @orders.shipping
    @shipped_orders = @orders.shipped
    @returned_orders = @orders.returned
  end

  def next_status
    case @order.status
    when "unpaid"
      @order.set_status("paid")
      @order.set_order_paid("by_admin")
      flash[:success] = "成功設定為已付款"
    when "paid"
      @order.set_status("shipping")
      flash[:success] = "成功設定為運送中"
      OrderMailer.shipping_notification(@order, @order.user.email).deliver
    when "shipping"
      @order.set_status("shipped")
      flash[:success] = "成功設定為已送達"
    when "shipped"
      @order.set_status("returned")
      flash[:success] = "成功設定為退貨訂單"
    when "returned"
      #TODO can't change to other status, should show some message
      flash[:warning] = "Last Step"
    else
      flash[:warning] = "請使用正常的付款方式"
    end
    redirect_to admin_orders_path
  end


  protected

  def find_order
    @order = Order.find(params[:id])
  end

end
