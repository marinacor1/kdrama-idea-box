class IdeasController < ApplicationController
  def index
    @ideas = current_user.ideas
    @user = current_user
    # if params[:user_id]
    #   @ideas = User.find(params[:user_id]).ideas
    #   @user = User.find(params[:user_id])
    # else
    #   @ideas = Idea.all
    # end
  end

  def new
    @user = current_user
    @idea = @user.ideas.new
  end

  def create
    @user = current_user
    @idea = @user.ideas.create(params_check)
    if @idea.save #possible break here
      redirect_to user_idea(@user)
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
    redirect_to user_ideas_path(@user, @idea)
  end

  private

  def params_check
    params.require(:idea).permit(:title, :description)
  end
end
