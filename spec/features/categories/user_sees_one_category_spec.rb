require 'rails_helper'

RSpec.feature "User sees one category" do
  before do
    @user = create(:full_user)
    @category = @user.jobs.first.category
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit categories_path
    within "ul.list-group" do
      click_on @category.title
    end
  end

  scenario "they view one category and its jobs" do
    jobs = @category.jobs
    jobs.each do |job|
      expect(page).to have_link job.title, href: company_job_path(job.company, job)
    end
  end

  scenario "they see a link back to all categories" do
    click_on "Back to All Categories"
    expect(current_path).to eq categories_path
  end
end