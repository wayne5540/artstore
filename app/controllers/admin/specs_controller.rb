class Admin::SpecsController < AdminController

  before_action :find_product
  before_action :find_spec, :only => [:edit, :update, :destroy]

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

  def edit
    @spec = @product.specs.find(params[:id])
  end

  def update
    @spec = @product.specs.find(params[:id])
    if @spec.update(spec_params)
      redirect_to admin_product_path(@product)
      flash[:success] = "規格已更新"
    else
      render :edit
      flash[:warning] = "規格更新失敗，請重新嘗試"
    end
  end

  def destroy
    @spec.destroy
    redirect_to admin_product_path(@product)
    flash[:success] = "規格已刪除"
  end


  protected

  def spec_params
    params.require(:spec).permit(:name, :detail, :product_id)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_spec
    @spec = @product.specs.find(params[:id])
  end

end
