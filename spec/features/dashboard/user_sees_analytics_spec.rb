require 'rails_helper'

RSpec.feature "User sees analytics" do
  before do
    @companies = create_list(:company_with_jobs_and_contacts, 10)
    @user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  
  scenario "they see the analytics on the dashboard" do
    visit dashboard_path
    expect(page).to have_content "Job Count by Level of Interest"
    expect(page).to have_css "th", text: "Interest Level Range"

    expect(page).to have_content "Top Companies by Average Level of Interest"
    expect(page).to have_css "h3"

    expect(page).to have_content "Job Count by City"
    expect(page).to have_css "li", text: @user.jobs.pluck(:city).first
    expect(Job.all).to_not eq @user.jobs
  end
end
    
