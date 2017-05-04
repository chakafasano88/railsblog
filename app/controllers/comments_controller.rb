class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  # Creates a new user with corresponding sessions
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(
      content: params[:comment][:content],
      date: params[:comment][:date],
      post_id: @post.id,
      user_id: session[:user_id]
    )

    @comment.save
    # @post.comments << new_comment

    redirect_to post_path(@post)
  end

  def edit
    @comment = Comment.find(params[:id])
  end
end
