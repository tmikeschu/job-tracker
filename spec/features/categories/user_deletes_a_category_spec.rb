require 'rails_helper'

RSpec.feature "User deletes a category" do
  before do
    @user = create(:full_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @category  = @user.categories.order(:title).first
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