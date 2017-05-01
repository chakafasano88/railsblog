class PostsController < ApplicationController
  def index
    @posts = Post.all
    @latest_posts = Post.all.last(5)
  end
  # Creates a new user with corresponding sessions
  def create
    @post = Post.create(
      user_id: session[:user_id],
      title: params[:post][:title],
      date: params[:post][:date],
      content: params[:post][:content]
    )

    redirect_to posts_path
  end

  def edit

  end
  # Creates an unstored user
  def new
  @post = Post.new
  end

  def show
    @post = Post.find(params[:user_id])
  end

  def update

  end
# Deletes a post
  def destroy
    @post = Post.find(params[:id])

   if @post.destroy
     flash[:notice] = "Post was deleted"
   else
     flash[:alert] = "Post could not be deleted"
   end

   redirect_to "/"
  end
end
