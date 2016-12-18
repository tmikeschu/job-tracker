=begin
As a user
given that a company exists in the database
if I go to a company page
and fill in contact info for a contact
and click Create contact
the page reloads
and I see that contact in the contacts table
=end

require 'rails_helper'

RSpec.feature "User creates a contact" do
  before do
    @company = create(:company_with_jobs)
    visit company_path(@company)
  end

  scenario "they add a contact for a company" do
    first_name, last_name, email = %w(Sam Gerk samgerk@email.com)
    fill_in "contact_first_name", with: first_name
    fill_in "contact_last_name", with: last_name
    fill_in "contact_email", with: email
    click_on "Create Contact"
    expect(current_path).to eq company_path(@company)
    expect(page).to have_content first_name
    expect(page).to have_content last_name
    expect(page).to have_content email
  end

end