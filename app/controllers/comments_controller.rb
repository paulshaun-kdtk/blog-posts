class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy]

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, alert: 'Error creating comment.'
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
