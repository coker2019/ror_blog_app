class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user
      @recent_posts = @user.most_recent_posts
    else
      flash[:alert] = 'User not found'
      redirect_to root_path
    end
    # rescue ActiveRecord::RecordNotFound
    #   redirect_to root_path
  end
end
