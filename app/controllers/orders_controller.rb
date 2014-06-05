class OrdersController < ApplicationController

  def new
    @order = current_user.orders.new
  end

  def create
    @cart = current_cart
    @order = current_user.orders.build

    redirect_to root_path
  end

end
