class UsersController < ApplicationController
  def new
    @title = "New User"
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name unless @user.name.blank? or @user.nil?
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Apigee App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
end
