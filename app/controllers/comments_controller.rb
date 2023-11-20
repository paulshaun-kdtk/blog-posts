# app/controllers/comments_controller.rb

class CommentsController < ApplicationController
    before_action :find_post
    before_action :find_comment, only: [:edit, :update, :destroy]
  
    def create
      @comment = @post.comments.build(comment_params)
      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        render 'posts/show'
      end
    end
  
    def edit
    end
  
    def update
      if @comment.update(comment_params)
        redirect_to @post, notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @comment.destroy
      redirect_to @post, notice: 'Comment was successfully destroyed.'
    end
  
    private
  
    def find_post
      @post = Post.find(params[:post_id])
    end
  
    def find_comment
      @comment = @post.comments.find(params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:text, :author_id)
    end
  end
  