class PostsController < ApplicationController
  before_action :find_post, only: %i[index show edit update destroy]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 10)
    else
      @posts = Post.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @recent_comments = @post.recent_comments
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    # logic to edit a post
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def find_post
    @post = Post.find(params[:user_id] || params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text).merge(author: current_user)
  end
end
