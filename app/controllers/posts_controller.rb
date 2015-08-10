class PostsController < ApplicationController

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
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

end
