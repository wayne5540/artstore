class Admin::ProductsController < AdminController

  before_action :find_product, :only => [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @category = @product.category
    @specs = @product.specs
  end

  def new
    @product = Product.new
    @new_spec = @product.specs.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
      flash[:success] = "成功新增商品"
    else
      render :new
      flash[:warning] = "新增商品失敗"
    end
  end

  def edit
    @new_spec = @product.specs
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
      flash[:success] = "產品已更新"
    else
      render :edit
      flash[:warning] = "產品更新失敗，請重新嘗試"
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
    params.require(:product).permit(:name, :description, :image, :category_id, :sellable, :price,
                                      specs_attributes: [:id, :name, :detail, :inventory, :product_id, :_destroy])
  end

end
