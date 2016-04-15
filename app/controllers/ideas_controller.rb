class IdeasController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def new
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.create(params_check)
    if @idea.save #possible break here
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
    if @idea.update(params_check)
      redirect_to @idea
    else
      render :edit
    end
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
