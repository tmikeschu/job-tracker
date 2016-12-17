require 'rails_helper'

RSpec.feature "User updates a category" do
  before do
    categories = create_list(:category, 2)
    @category1 = categories.first
    @category2 = categories.last
    visit categories_path
    within "ul.list-group" do
      first(:link, "Edit").click
    end
  end

  scenario "they edit a category's title" do
    new_title = "DEV"
    fill_in "category_title", with: new_title
    click_on "Update Category"
    expect(current_path).to eq categories_path
    expect(page).to have_link new_title, href: category_path(@category1)
    expect(page).to_not have_link @category1.title, href: category_path(@category1)
  end

  context "when they enter a duplicate name" do
    scenario "they receive an error message" do
      fill_in "category_title", with: @category2.title
      click_on "Update Category"
      expect(page).to have_content "Whoops!"
      expect(page).to have_content "already been taken"
    end
  end

  context "when they enter an empty title" do
    scenario "they receive an error message" do
      fill_in "category_title", with: ""
      click_on "Update Category"
      expect(page).to have_content "Title can't be blank"
    end
  end
end  
