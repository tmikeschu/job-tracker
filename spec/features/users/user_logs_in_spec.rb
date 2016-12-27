require 'rails_helper'

RSpec.feature "User logs in" do
  before do
    @user = create(:full_user)
  end

  scenario "they log in successfully" do
    visit root_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "Log in"
    expect(current_path).to eq dashboard_path
    expect(page).to have_content "Login successful!"
  end

  context "when they enter the wrong password" do
    scenario "they see an error" do
      visit root_path
      fill_in "email", with: @user.email
      fill_in "password", with: ";lkjasdlfj;af"
      click_on "Log in"
      expect(page).to have_content "Incorrect password. Try again."
    end
  end

  context "when they enter the wrong email" do
    scenario "they see an error" do
      visit root_path
      fill_in "email", with: @user.email + "z"
      fill_in "password", with: @user.password
      click_on "Log in"
      expect(page).to have_content "Unknown email. Try again."
    end
  end
end