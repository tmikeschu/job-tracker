class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      @errors = @category.errors.full_messages
      render :new
    end
  end

  private
    def category_params
      params.require(:category).permit(:title)
    end
end
