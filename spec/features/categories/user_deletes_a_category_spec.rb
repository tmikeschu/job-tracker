require 'rails_helper'

RSpec.feature "User deletes a category" do
  before do
    categories = create_list(:category, 5)
    @category  = categories.first
    visit categories_path
  end

  scenario "they delete a category" do
    expect(page).to have_link @category.title, href: category_path(@category)
    within "ul.list-group" do
      first(:link, "Delete").click
    end
    expect(current_path).to eq categories_path
    expect(page).to_not have_link @category.title, href: category_path(@category)
  end
end