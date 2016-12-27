require 'rails_helper'

RSpec.feature "User sees all companies" do
  scenario "a user sees all the companies" do
    @user = create(:full_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    company     = @user.companies.first
    company_two = @user.companies.last

    visit companies_path

    expect(page).to have_link company.name, href: company_path(company)
    expect(page).to have_link company_two.name, href: company_path(company_two)
  end
end
