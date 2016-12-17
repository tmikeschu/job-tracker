class JobsController < ApplicationController
  
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :new, :create]
  before_action :set_categories, only: [:new, :edit]
  
  def index
    @jobs  = @company.jobs
    @title = "JTrack | Jobs @ #{@company.name}"
  end

  def new
    @job = Job.new
  end

  def create
    @job = @company.jobs.new(job_params)
    if job_params["category_id"] == ""
      @errors = ["Please enter a category"]
      render :edit
    elsif @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      @errors = @job.errors.full_messages
      render :new
    end
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
    if job_params["category_id"] == ""
      @errors = ["Please enter a category"]
      render :edit
    elsif @job.update(job_params)
      flash[:success] = "#{@job.title} was updated!"
      redirect_to company_job_path(@job.company, @job)
    else
      @errors = @job.errors.full_messages
      render :edit
    end
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
    @company = Company.find(params[:company_id])
  end

  def set_categories
    @categories = Category.all
  end    

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
