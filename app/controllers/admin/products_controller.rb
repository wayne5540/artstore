class Admin::ProductsController < ApplicationController

  before_action :login_required
  before_action :find_product, :only => [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
      flash[:success] = "成功新增商品"
    else
      render :new
      flash[:warning] = "新增商品失敗"
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
      flash[:success] = "產品已更新"
    else
      render :edit
      flash[:success] = "產品更新失敗，請重新嘗試"
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
    flash[:success] = "商品已刪除"
  end

  protected

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end

end
