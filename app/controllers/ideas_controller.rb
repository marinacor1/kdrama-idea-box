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

  private

  def params_check
    params.permit(:idea).require(:title, :description)
  end
end
