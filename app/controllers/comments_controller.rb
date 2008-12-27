class CommentsController < ApplicationController
  before_filter :find_post
  before_filter :authenticate, :only => :destory
  
  def new
    @comment = @post.comments.build
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:notice] = 'There was a trouble saving your comment'
    end
    redirect_to @post
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post
  end
  
  protected
  def find_post
    @post = Post.find(params[:post_id])
  end
end
