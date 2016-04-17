class IdeasController < ApplicationController
  before_action :require_login!

  def index
    @ideas = current_user.ideas
    @user = current_user
  end

  def new
    @user = current_user
    @idea = @user.ideas.new
  end

  def create
    @user = current_user
    @idea = @user.ideas.create(params_check)
    if @idea.save
      redirect_to @idea
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @user = @idea.user
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(params_check)
    redirect_to @idea
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end

  private

  def params_check
    params.require(:idea).permit(:title, :description)
  end
end
