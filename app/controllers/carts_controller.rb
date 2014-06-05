class CartsController < ApplicationController

  def index
    @cart = current_cart
    @items = @cart.items
    @sum = @items.inject(0){|sum, item| sum + item.product.price }
  end

end
