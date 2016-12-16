=begin 
As a user
If I visit the categories page,
and I click "New Category",
and I fill in a category title,
and I click "Create Category",
I return to the categories page,
and the list now includes the new category.
=end
require 'rails_helper'

RSpec.feature "User creates a category" do
  scenario "a user creates a new category" do
    visit categories_path
    click_on "New Category"
    fill_in "category_title", with: "Web Development"
    click_on "Create Category"
    expect(current_path).to eq categories_path
    expect(page).to have_link "Web Development", href: category_jobs_path(Category.first)
  end

  xcontext "when they enter nothing for title" do
    scenario "they see an error message" do
    end
  end

  xcontext "when they enter an existing title" do
    scenario "they see an error message" do
    end
  end
end