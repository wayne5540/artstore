class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
      flash[:success] = "成功更新會員"
    else
      render :edit
      flash[:success] = "更新失敗"
    end
  end


  protected

  def user_params
    params.require(:user).permit(:name, :email, :role_ids => [])
  end

end
