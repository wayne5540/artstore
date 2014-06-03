class CartsController < ApplicationController
  def index
  end
  def create
    @cart_item = CartItem.create
    redirect_to root_path
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_id, :spec_id, :quantity)
  end 

end
