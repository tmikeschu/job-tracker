class DashboardController < ApplicationController
  def show
    @jobs = Job.all
    @companies = Company.all
    @interest_level_and_jobs = Job.group(:level_of_interest).order("level_of_interest DESC").count
  end
end
