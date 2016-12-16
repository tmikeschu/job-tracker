require 'rails_helper'

RSpec.feature "User creates a category" do
  scenario "a user creates a new category" do
    visit categories_path
    click_on "New Category"
    fill_in "category_title", with: "Web Development"
    click_on "Create Category"
    expect(current_path).to eq categories_path
    expect(page).to have_link "Web Development", href: category_path(Category.first)
  end

  context "when they enter nothing for title" do
    scenario "they see an error message" do
      visit categories_path
      click_on "New Category"
      fill_in "category_title", with: ""
      click_on "Create Category"
      expect(page).to have_content "Whoops!"
      expect(page).to have_content "Title can't be blank"
    end
  end

  context "when they enter an existing title" do
    scenario "they see an error message" do
      category = create(:category)
      visit categories_path
      click_on "New Category"
      fill_in "category_title", with: category.title
      click_on "Create Category"
      expect(page).to have_content "Whoops!"
      expect(page).to have_content "already been taken"
    end
  end
end