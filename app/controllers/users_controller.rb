class UsersController < ApplicationController
  before_action :require_login!, except: [:new, :create]

  def index
   @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params_check) #might want to do new
    if @user.save
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
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
