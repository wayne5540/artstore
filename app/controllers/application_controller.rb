class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart
  
  def login_required
    if current_user.blank?
      respond_to do |format|
        format.html  {
          authenticate_user!
        }
        format.js{
          render :partial => "common/not_logined"
        }
        format.all {
          head(:unauthorized)
        }
      end
    end  
  end

  def admin_required
    unless current_user && current_user.admin?
      redirect_to (request.referrer || root_path)
      flash[:danger] = "Ohoh~你沒有管理員權限唷。"      
    end
  end

  protected

  def current_cart
    @current_cart ||= cart_finder
  end

  def cart_finder
    cart = Cart.find_by(id: session[:cart_id])
    unless cart.present?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    cart
  end

  def reset_cart
    current_cart.delete
    session.delete(:cart_id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password,:password_confirmation)}
  end
end
