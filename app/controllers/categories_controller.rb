class CategoriesController < ApplicationController
  include CategoriesHelper

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    save_category(@category)
  end

  def show
    @jobs = current_user.jobs.where(category_id: params[:id])
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
      @category = current_user.categories.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:title)
    end
end
