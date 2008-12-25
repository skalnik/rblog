class CommentsController < ApplicationController
  before_filter :find_post
  before_filter :authenticate, :only => :destory
  # GET /comments
  # GET /comments.xml
  def index
    @comments = @post.comments.find(:all)
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = @post.comments.find(params[:id])
  end

  def new
    @comment = @post.comments.build
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.build(params[:comments])
    if @comment.save
      flash[:notice] = 'Comments was successfully created.'
      redirect_to(@comments)
    else
      render :action => "new"
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comments = Comments.find(params[:id])
    @comments.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def find_post
    @post = Post.find(params[:post_id])
  end
end
