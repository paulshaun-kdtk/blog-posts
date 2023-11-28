class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

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

  def edit; end

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

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end
end
