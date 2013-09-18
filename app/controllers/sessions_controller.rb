class SessionsController < ApplicationController

  skip_before_filter :login_required, :only => [:new, :create, :welcome]

  def new
    @title = "Login"
  end

  def welcome
    @title = "Welcome"
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

  def factor
    @factor_about = about_info params[:factor]
  end

  def about
    
  end

  private

  def about_info factor
    case factor
    when "thinking"
      "sessions/thinking"
    when "willing"
      "sessions/willing"
    when "interactions"
      "sessions/interactions"
    when "discipline"
      "sessions/discipline"
    when "direction"
      "sessions/direction"
    when "expectations"
      "sessions/expectations"
    end
  end

end
