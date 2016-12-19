class JobsController < ApplicationController
  include JobsHelper
  
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :new, :create]
  before_action :set_categories, only: [:new, :edit]
  
  def index
    @jobs = Job.all
    if params[:sort] == "location"
      @cities = Job.pluck(:city)
      render :city_sorted
    elsif params[:sort] == "interest"
      @levels_of_interest = Job.pluck(:level_of_interest)
      render :interest_sorted
    elsif params[:location]
      @city = params[:location]
      render :location 
    else
      @jobs  = @company.jobs
      @contact = Contact.new
      @contacts = @company.contacts
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = @company.jobs.new(job_params)
    save_job(@job, job_params)
  end

  def show
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = @job.company
  end

  def update
    @company = @job.company
    update_job(@job, job_params)
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path(@job.company)
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id]) if params[:company_id]
  end

  def set_categories
    @categories = Category.all
  end    

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
