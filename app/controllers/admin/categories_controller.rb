class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
