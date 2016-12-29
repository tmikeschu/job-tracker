require 'rails_helper'

RSpec.feature "User creates a category" do
  before do
    @user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  scenario "a user creates a new category" do
    visit categories_path
    find(".btn-success").click
    fill_in "category_title", with: "Web Development"
    click_on "Create Category"
    expect(current_path).to eq categories_path
    expect(page).to have_link @user.categories.first.title, href: category_path(@user.categories.first)
  end

  context "when they enter nothing for title" do
    scenario "they see an error message" do
      visit categories_path
      find(".btn-success").click
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
      find(".btn-success").click
      fill_in "category_title", with: category.title
      click_on "Create Category"
      expect(page).to have_content "Whoops!"
      expect(page).to have_content "already been taken"
    end
  end
end