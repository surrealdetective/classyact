class SessionsController < ApplicationController

  skip_before_filter :login_required, :only => [:new, :create]

  def new
    @title = "Login"
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path, :notice => "You are logged out"
  end

end
