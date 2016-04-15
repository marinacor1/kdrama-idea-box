class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params_check)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def params_check
    params.require(:user).permit(:username, :password)
  end
end
