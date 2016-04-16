class SessionsController < ApplicationController
  # before_action :require_login!, only: [:destroy]

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      redirect_to login_path # flash
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
