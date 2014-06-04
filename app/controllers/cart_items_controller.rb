class CartItemsController < ApplicationController

  def create
    @cart = current_cart
    @cart_item = @cart.items.new(cart_item_params)

    if @cart_item.save
      redirect_to carts_path
      flash[:success] = "成功加入購物車"
    else
      redirect_to product_path(params[:cart_item][:product_id])
      flash[:warning] = "購物車加入失敗，可能是因為誠意不足。"
    end

  end



  protected

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :spec_id, :product_id)
  end  

end
