class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  # Creates a new user with corresponding sessions
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:username :content))

    redirect_to post_path(@post)

  end

  def edit
    @comment = Comment.find(params[:id])
  end
  # Creates an unstored user
  def new
    @comment = @post.comments.new
  end
