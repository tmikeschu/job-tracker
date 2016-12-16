require 'rails_helper'

RSpec.feature "User edits an existing company" do
  before do
    @companies = create_list(:company, 2)
  end

  scenario "a user can edit a company" do
    company  = @companies.first
    old_name = company.name
    visit edit_company_path(company)

    fill_in "company_name", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq company_jobs_path(company)
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content old_name
  end
end
