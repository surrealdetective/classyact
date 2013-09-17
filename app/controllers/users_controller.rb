class UsersController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(:email => params[:email], :password => params[:password])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
    @surveys = @user.surveys
    authorize! :show, @user
  end

  def info
    
  end
end
