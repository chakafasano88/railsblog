class UsersController < ApplicationController
  def index
    @users = User.all
  end
# Creates a new user with corresponding sessions
  def create
    @user = User.create(
      fname: params[:user][:fname],
      lname: params[:user][:lname],
      username: params[:user][:username],
      password: params[:user][:password]
    )

    session[:user_id] = @user.id

    redirect_to home_path
end

def edit
  @user = User.find(params[:id])
end
# Creates an unstored user
def new
  @user = User.new

end
# Displays user info
def show
  @user = User.find(session[:user_id])
  @posts = @user.posts
end

def update
  @user = User.find(params[:id])
  @user.fname = params[:user][:fname]
  @user.lname = params[:user][:lname]
  @user.password = params[:user][:password]

  if @user.save
    flash[:notice] = "The user was updated"
    redirect_to user_path(@user)
  else
    flash[:alert] = "The user was not updated"
    redirect_to edit_user_path(@user)
  end
end


  def destroy
    @user = User.find(params[:id])

   if @user.destroy
     flash[:notice] = "User was deleted"
   else
     flash[:alert] = "User could not be deleted"
   end

   redirect_to "/"
  end
end

def current_user
return unless session[:user_id]
@current_user ||= User.find(session[:user_id])
end
