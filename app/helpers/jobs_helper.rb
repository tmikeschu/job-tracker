module JobsHelper
  def save_job(job, job_params)
    if job_params["category_id"] == ""
      no_category_error
    elsif job.save
      flash[:success] = "You created #{job.title} at #{job.company.name}"
      redirect_to company_job_path(job.company, job)
    else
      errors(job)
    end
  end

  def update_job(job, job_params)
    if job_params["category_id"] == ""
      no_category_error
    elsif job.update(job_params)
      flash[:success] = "#{job.title} was updated!"
      redirect_to company_job_path(job.company, job)
    else
      errors(job)
    end
  end

  def no_category_error
    @errors = ["Please enter a category"]
    render :edit
  end
  
  def errors(job)
    @errors = job.errors.full_messages
    render :edit
  end
end