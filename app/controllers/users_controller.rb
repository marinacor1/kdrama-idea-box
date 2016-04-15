class UsersController < ApplicationController
  def index
   @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params_check)
    if @user.save
      byebug
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def params_check
    params.require(:user).permit(:username, :password)
  end
end
