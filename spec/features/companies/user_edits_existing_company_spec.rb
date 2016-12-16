require 'rails_helper'

RSpec.feature "User edits an existing company" do
  before do
    @companies = create_list(:company, 2)
    @company    = @companies.first
    visit edit_company_path(@company)
  end

  scenario "a user can edit a company" do
    old_name   = @company.name
    fill_in "company_name", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq company_jobs_path(@company)
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content old_name
  end

  context "when they enter a blank name" do
    scenario "they see an error message" do
      fill_in "company_name", with: ""
      click_button "Update"

      expect(page).to have_content "Name can't be blank"
    end
  end

  context "when they enter an existing name" do
    scenario "they see an error message" do
      fill_in "company_name", with: @companies.last.name
      click_button "Update"

      expect(page).to have_content "Whoops!"
      expect(page).to have_content "already been taken"
    end
  end

end
