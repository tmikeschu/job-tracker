require 'rails_helper'

RSpec.feature "User creates an account" do
  scenario "they can create an account" do
    visit root_path
    click_on "Create an Account"
    fill_in "user_first_name", with: "Mike"
    fill_in "user_last_name", with: "Schutte"
    fill_in "user_email", with: "t@mike.schutte"
    fill_in "user_password", with: "password123"
    click_on "Create Account"

    expect(page).to have_content "Account created. Welcome!"
  end
end