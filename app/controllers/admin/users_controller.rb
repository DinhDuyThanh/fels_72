class Admin::UsersController < ApplicationController
  before_action :verify_admin?, only: [:destroy, :index]

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    @user = User.find params[:id]
    if !(current_user? @user) && @user.destroy
     flash[:success] = t "save_submit"
    else
      flash[:danger] = t "danger"
    end
    redirect_to admin_users_url
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes admin: true
      flash[:success] = t "save_submit"
    else
      flash[:danger] = t "danger"
    end
    redirect_to admin_users_url
  end
end
