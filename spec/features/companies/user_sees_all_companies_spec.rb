require 'rails_helper'

RSpec.feature "User sees all companies" do
  scenario "a user sees all the companies" do
    company     = Company.create!(name: "ESPN")
    company_two = Company.create!(name: "Disney")

    visit companies_path

    expect(page).to have_link "ESPN", href: company_path(company)
    expect(page).to have_link "Disney", href: company_path(company_two)
  end
end
