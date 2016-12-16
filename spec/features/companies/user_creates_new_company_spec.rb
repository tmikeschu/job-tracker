require 'rails_helper'

RSpec.feature "User creates a new company" do
  before do
    visit companies_path
    click_on "Add New Company"
  end

  scenario "a user can create a new company" do
    fill_in "company_name", with: "ESPN"
    click_on "Create"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(Company.count).to eq(1)
  end

  context "when they enter invalid data" do
    scenario "they receive an error" do
      fill_in "company_name", with: ""
      click_on "Create"

      expect(page).to have_content "Name can't be blank"
    end
  end
 
  context "when they enter a duplicate name" do
    scenario "they receive an error" do
      fill_in "company_name", with: "ESPN"
      click_on "Create"

      visit companies_path
      click_on "Add New Company"
      fill_in "company_name", with: "ESPN"
      click_on "Create"
      expect(page).to have_content "Name has already been taken"
    end
  end

end
