require 'rails_helper'

RSpec.feature "User sees analytics" do
  before do
    @companies = create_list(:company_with_jobs_and_contacts, 10)

  end
  
  scenario "they see the analytics on the dashboard" do
    visit dashboard_path
    expect(page).to have_content "Job Count by Level of Interest"
    expect(page).to have_css "th", text: "Interest Level Range"

    expect(page).to have_content "Top Companies by Average Level of Interest"
    expect(page).to have_css "h3"

    expect(page).to have_content "Job Count by City"
    expect(page).to have_css "li", text: @companies.first.jobs.first.city
  end
end
    
