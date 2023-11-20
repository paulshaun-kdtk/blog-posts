# app/controllers/likes_controller.rb

class LikesController < ApplicationController
    before_action :find_post
  
    def create
      @like = @post.likes.build(like_params)
      if @like.save
        redirect_to @post, notice: 'Like was successfully created.'
      else
        redirect_to @post, alert: 'Failed to create like.'
      end
    end
  
    private
  
    def find_post
      @post = Post.find(params[:post_id])
    end
  
    def like_params
      params.require(:like).permit(:author_id)
    end
  end
  