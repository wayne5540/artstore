class Admin::SpecsController < ApplicationController

  before_action :login_required
  before_action :admin_required
  before_action :find_product

  def new
    @spec = @product.specs.new
  end

  def create
    @spec = @product.specs.new(spec_params)
    if @spec.save
      redirect_to admin_product_path(@product)
      flash[:success] = "成功新增規格"
    else
      render :new
      flash[:warning] = "新增規格失敗"
    end
  end


  protected

  def spec_params
    params.require(:spec).permit(:name, :detail, :product_id)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

end
