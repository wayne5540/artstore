class CartsController < ApplicationController

  def index
    @cart = current_cart
    @items = @cart.items
  end

end
