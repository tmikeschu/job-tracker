require "rails_helper"

RSpec.feature "User logs out" do
  before do
    @user = create(:user)
  end

  scenario "they log out" do
    visit dashboard_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    within ".col-md-6:nth-child(1)" do
      click_on "Log in"
    end
    expect(current_path).to eq dashboard_path
    click_on "Log out"
    expect(page).to have_content "Logout successful!"
    expect(current_path).to eq login_path
  end

  after do
    User.last.destroy
  end
end