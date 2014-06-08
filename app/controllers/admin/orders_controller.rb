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
    @order.next_step
    redirect_to admin_orders_path
  end


  protected

  def find_order
    @order = Order.find(params[:id])
  end

end
