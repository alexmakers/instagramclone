class PostsController < ApplicationController

  before_action :fetch_user_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :update]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :content, :image, :tag_names))
    @post.user = current_user

    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def index
    @posts = Post.for_tag_or_all(params[:tag_id]).order('created_at DESC')
  end

  def edit
  end

  def update
    if @post.update(params[:post].permit(:title, :content, :image, :tag_names))
      redirect_to '/posts'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def fetch_user_post
    # @post = Post.find_by(id: params[:id], user: current_user)
    @post = current_user.posts.find(params[:id])
  end
end
