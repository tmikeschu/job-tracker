require 'rails_helper'

RSpec.feature "User sees all categories" do

  before do
    @user = User.first
    @categories = @user.categories
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
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