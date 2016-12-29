require 'rails_helper'

RSpec.feature "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    @user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    company = @user.companies.last
    job = company.jobs.first

    visit company_job_path(company, job)

    expect(page).to have_content job.company.name
    expect(page).to have_content job.title
    expect(page).to have_content job.description
    expect(page).to have_content job.level_of_interest
    expect(page).to have_content job.city
  end
end
