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
    @post = Post.find(params[:id])

  end
  # Creates an unstored user
  def new
  @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.date = params[:post][:date]
    @post.content = params[:post][:content]

    if @user.save
      flash[:notice] = "The user was updated"
      redirect_to user_path(@user)
    else
      flash[:alert] = "The user was not updated"
      redirect_to edit_user_path(@user)
    end

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
