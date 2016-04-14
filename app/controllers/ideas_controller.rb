class IdeasController < ApplicationController
  def index
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(params_check)
    redirect_to @idea
  end

  def show
    @idea = Idea.find(params[:id])
  end

  private

  def params_check
    params.require(:idea).permit(:title, :description)
  end
end
