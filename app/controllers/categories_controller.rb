class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :destroy]
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

  def show
    @jobs = @category.jobs
  end 

  def edit
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:title)
    end
end
