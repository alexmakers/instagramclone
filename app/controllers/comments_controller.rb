class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment].permit(:text))
    @comment.post_id = @post.id
    @comment.user = current_user
    # @post.comments << @comment

    if @comment.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def show
  end

end
