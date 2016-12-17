class CategoriesController < ApplicationController
  
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} was created!"
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

  def update
    if @category.update(category_params)
      flash[:success] = "#{@category.title} was updated!"
      redirect_to categories_path
    else
      @errors = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "#{@category.title} was deleted."
    redirect_to categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:title)
    end
end
