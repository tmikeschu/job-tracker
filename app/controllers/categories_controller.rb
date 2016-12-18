class CategoriesController < ApplicationController
  include CategoriesHelper

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    save_category(@category)
  end

  def show
    @jobs = @category.jobs
  end 

  def edit
  end

  def update
    update_category(@category, category_params)
  end

  def destroy
    destroy_category(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:title)
    end
end
