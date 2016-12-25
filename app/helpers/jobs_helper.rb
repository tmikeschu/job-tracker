module JobsHelper
  def save_job(job, job_params)
    return no_category_error if job_params["category_id"] == ""
    if job.save
      flash[:success] = "You created #{job.title} at #{job.company.name}"
      redirect_to company_job_path(job.company, job)
    else
      errors(job)
    end
  end

  def update_job(job, job_params)
    return no_category_error if job_params["category_id"] == ""
    if job.update(job_params)
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

  def full_name(contact)
    "#{contact.first_name.capitalize} #{contact.last_name.capitalize}"
  end

  def jobs_in_city(city)
    current_user.jobs.where(city: city)
  end

  def jobs_with_level_of_interest(level_of_interest)
    current_user.jobs.where(level_of_interest: level_of_interest)
  end

  def levels_of_interest
    current_user.jobs.pluck(:level_of_interest).uniq.sort.reverse
  end

  def cities
    current_user.jobs.order(:city).distinct.pluck(:city)
  end
  
  def decide_which_index(params)
    @jobs = current_user.jobs
    return sorted_jobs(params) if params[:sort]
    return location_jobs(params) if params[:location]
    @jobs  = current_user.jobs.where(company_id: @company.id)
    @contact = Contact.new
    @contacts = @company.contacts
  end

  def sorted_jobs(params)
    render :city_sorted     if params[:sort] == "location"
    render :interest_sorted if params[:sort] == "interest"
  end

  def location_jobs(params)
    @city = params[:location]
    render :location
  end

  def alphabetize_jobs(jobs)
    jobs.order(:title)
  end 
end