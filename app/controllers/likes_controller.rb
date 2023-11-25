class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @like = @post.likes.build(like_params)
    if @like.save
      redirect_to @post, notice: 'Like was successfully created.'
    else
      redirect_to @post, alert: 'Error creating like.'
    end
  end

  def destroy
    @like.destroy
    redirect_to @post, notice: 'Like was successfully destroyed.'
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:author_id)
  end
end
