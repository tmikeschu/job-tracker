require "rails_helper"

RSpec.feature "User logs out" do
  before do
    @user = create(:full_user)
  end

  scenario "they log out" do
    visit dashboard_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "Log in"
    expect(current_path).to eq dashboard_path
    click_on "Log out"
    expect(page).to have_content "Logout successful!"
    expect(current_path).to eq login_path
  end
end