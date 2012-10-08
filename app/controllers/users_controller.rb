class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User saved. Welcome to the Training App!"
      redirect_to @user #Handle a successful save.
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
