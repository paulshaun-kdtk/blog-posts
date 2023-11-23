class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    @recent_comments = @post.recent_comments
  end
end
