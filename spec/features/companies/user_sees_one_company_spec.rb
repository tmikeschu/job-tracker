require 'rails_helper'

RSpec.feature "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    expect(current_path).to eq company_jobs_path(company)
    expect(page).to have_content("ESPN")
    expect(page).to have_link "Developer", href: company_job_path(company, company.jobs.first)
  end
end
