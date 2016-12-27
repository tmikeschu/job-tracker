require 'rails_helper'

RSpec.feature "User sees one company" do
  scenario "a user sees a company" do
    @user = create(:full_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    company = @user.companies.first

    visit company_path(company)

    expect(current_path).to eq company_jobs_path(company)
    expect(page).to have_content company.name
    expect(page).to have_link company.jobs.first.title, href: company_job_path(company, company.jobs.first)
  end
end
