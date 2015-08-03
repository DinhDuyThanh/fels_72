class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  def verify_user!
    unless logged_in?
      flash[:danger] = t "login_warning"
      redirect_to login_url
    end
  end  

  def verify_admin?
    unless logged_in? && current_user.admin?
      flash[:danger] = t "permission_warning"
      redirect_to login_url
    end
  end
end
