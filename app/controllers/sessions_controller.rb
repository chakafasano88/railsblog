class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.where(username: params[:username]).first
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "You've been signed in successfully"
    else
      flash[:notice] = "There was an issue signing you in"
     end
     redirect_to home_path
 end

def destroy
  session[:user_id] = nil
  redirect_to "/"
end

end
