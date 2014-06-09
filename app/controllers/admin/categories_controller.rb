class Admin::CategoriesController < AdminController

  before_action :find_category, :only => [:show, :edit, :update, :destroy]


  def index
    @categories = Category.all
  end

  def show
    @category = Category.includes(:products).find(params[:id])
    @products = @category.products
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
      flash[:success] = "成功新增分類"
    else
      render :new
      flash[:warning] = "新增分類失敗"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:success] = "分類已更新"
    else
      render :edit
      flash[:warning] = "分類更新失敗，請重新嘗試"
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
    flash[:success] = "分類已刪除，該分類底下的商品也已全數刪除。"
  end

  protected

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
