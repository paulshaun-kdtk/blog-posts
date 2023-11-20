class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
  
    def index
      @posts = Post.all
    end
  
    def show
      @recent_comments = @post.recent_comments
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  
    def edit
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
  
    private
  
    def find_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :text, :author_id)
    end
  end
  