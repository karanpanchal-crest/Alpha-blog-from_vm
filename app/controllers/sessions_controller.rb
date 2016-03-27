class SessionsController < ApplicationController

  def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome to Alpha Blog, #{user.username}"
      redirect_to user_path(user)
    else
      flash[:danger] = "Username or/and password is/are incorrect"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to pages_home_path
  end

end
