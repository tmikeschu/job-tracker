module JobsHelper
  def save_job(job, job_params)
    if job_params["category_id"] == ""
      @errors = ["Please enter a category"]
      render :edit
    elsif job.save
      flash[:success] = "You created #{job.title} at #{job.company.name}"
      redirect_to company_job_path(job.company, job)
    else
      @errors = job.errors.full_messages
      render :new
    end
  end
end