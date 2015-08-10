class PostsController < ApplicationController

  before_filter :authorize, except: [:index, :show]

  # show ALL recipes in db
  def index
    @posts = Post.all
    render :index
  end

  # form to create new post
  def new
    @post = Post.new
    render :new
  end

  # creates new post in DB
  # that belongs to current_user
  def create
    # post = Post.create(post_params)
    # current_user.posts << post
    # or
    post = current_user.posts.create(post_params)

    redirect_to post_path(post)
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.posts.include? @post
      render :edit
    else
      redirect_to profile_path
    end
  end

  def update
    post = Post.find(params[:id])
    if current_user.posts.include? @post
        post.update_attributes(post_params)
        redirect_to post_path(post)
    else
      redirect_to profile_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.posts.include? @post
        post.destroy(post_params)
        redirect_to post_path(post)
    else
      redirect_to profile_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

end
