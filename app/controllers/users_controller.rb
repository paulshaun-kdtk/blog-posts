class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update, :destroy, :create]
  before_action :find_user, only: [:show, :update, :destroy]
  
  def index
    @users_with_posts_count = User.left_joins(:posts).select('users.*, COUNT(posts.id) AS posts_count').group('users.id').order('posts_count DESC')
  end

  def show
    @user_posts = @user.posts
    @recent_posts = @user.recent_posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def restrict_user_creation_if_users_exist
    redirect_to root_path, alert: 'New user creation is not allowed.' if User.any?
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])

    unless @user
      flash[:alert] = 'User not found'
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end
end
