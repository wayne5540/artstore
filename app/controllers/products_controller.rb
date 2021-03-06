class ProductsController < ApplicationController

  def index
    @products = Product.sellable
  end

  def show
    @product = Product.find(params[:id])
    unless @product.sellable
      redirect_to (request.referrer || root_path)
      flash[:warning] = "抱歉，您找的商品不存在"
    end
  end

end
