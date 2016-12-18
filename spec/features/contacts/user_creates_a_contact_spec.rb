require 'rails_helper'

RSpec.feature "User creates a contact" do
  before do
    @company = create(:company_with_jobs)
    @first_name, @last_name, @position, @email = %w(Sam Gerk developer samgerk@email.com)
    visit company_path(@company)
  end

  scenario "they add a contact for a company" do
    fill_in "contact_first_name", with: @first_name
    fill_in "contact_last_name", with: @last_name
    fill_in "contact_position", with: @position
    fill_in "contact_email", with: @email
    click_on "Create Contact"
    expect(current_path).to eq company_jobs_path(@company)
    expect(page).to have_content @first_name
    expect(page).to have_content @last_name
    expect(page).to have_content @position
    expect(page).to have_content @email
  end

  context "when they do not fill in a first name" do
    scenario "they receive an error" do
      fill_in "contact_first_name", with: ""
      fill_in "contact_last_name", with: @last_name
      fill_in "contact_position", with: @position
      fill_in "contact_email", with: @email
      click_on "Create Contact"
      expect(page).to have_content "Whoops! First name can't be blank."
      expect(page).to_not have_content @last_name
    end
  end

  context "when they submit a non-unique email" do
    scenario "they receive an error message and can see the original contact row" do
      @company.contacts.create(first_name: @first_name, last_name: @last_name, position: @position, email: @email)
      fill_in "contact_first_name", with: 'hello'
      fill_in "contact_last_name", with: "my"
      fill_in "contact_position", with: "position"
      fill_in "contact_email", with: @email
      click_on "Create Contact"
      expect(page).to have_content "Whoops! Email has already been taken."
      expect(page).to have_content @first_name
      expect(page).to have_content @last_name
      expect(page).to have_content @position
      expect(page).to have_content @email
    end
  end
end