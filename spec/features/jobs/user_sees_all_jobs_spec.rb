require 'rails_helper'

RSpec.feature "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    @user = create(:full_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    company = @user.companies.first

    visit company_path(company)

    company.jobs.each do |job|
      expect(page).to have_link job.title, href: company_job_path(company, job)
    end
  end
end
