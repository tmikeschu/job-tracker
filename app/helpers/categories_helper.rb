module CategoriesHelper
  def save_category(category)
    if category.save
      flash[:success] = "#{category.title} was created!"
      redirect_to categories_path
    else
      @errors = category.errors.full_messages
      render :new
    end
  end

  def update_category(category, category_params)
    if category.update(category_params)
      flash[:success] = "#{category.title} was updated!"
      redirect_to categories_path
    else
      @errors = category.errors.full_messages
      render :edit
    end
  end

  def destroy_category(category)
    @category.destroy
    flash[:success] = "#{@category.title} was deleted."
    redirect_to categories_path
  end

  def job_and_company(job)
    "#{job.title} @ #{job.company.name}"
  end
  def alphabetical_categories
    Category.order(:title)
  end
end
