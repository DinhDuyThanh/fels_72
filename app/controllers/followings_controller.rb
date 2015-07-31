class FollowingsController < ApplicationController
  before_action :verify_user!

  def index
    @user = User.find params[:user_id] 
    @users = @user.following.paginate page: params[:page]
  end
end
