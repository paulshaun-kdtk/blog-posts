class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
    @recent_posts = @user.recent_posts
  end
end
