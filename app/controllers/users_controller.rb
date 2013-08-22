class UsersController < ApplicationController
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
  end
end
