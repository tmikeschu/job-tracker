require 'rails_helper'

RSpec.feature "User sees all categories" do

  before do
    @categories = create_list(:category, 10)
    visit categories_path
  end

  scenario "they see a list of all the categories" do
    @categories.each do |category|
      expect(page).to have_link category.title, href: category_path(category)
    end
  end

  scenario "they see links to edit, delete, and add" do
    category = @categories.first
    expect(page).to have_link "Edit", href: edit_category_path(category)
    expect(page).to have_link "Delete", href: category_path(category)
    expect(page).to have_link "New Category", href: new_category_path
  end
end