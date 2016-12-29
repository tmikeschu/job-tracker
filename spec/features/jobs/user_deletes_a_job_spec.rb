require 'rails_helper'

RSpec.feature 'User deletes a job' do
  
  before do
    @user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @company = @user.companies.last
    @jobs    = @company.jobs
    @job     = @jobs[4]
  end

  scenario 'they delete a job and return to index page' do
    visit company_jobs_path(@company)
    click_on @job.title
    click_on "Delete"
    expect(current_path).to eq company_jobs_path(@company)
    expect(page).to_not have_link @job.title, href: company_job_path(@company, @job)
  end
end