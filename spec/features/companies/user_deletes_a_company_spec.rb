require 'rails_helper'

RSpec.feature "User deletes existing company" do
  scenario "a user can delete a company" do
    @user = create(:full_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    company = @user.companies.first
    visit companies_path

    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("#{company.name} was successfully deleted!")
  end
end
