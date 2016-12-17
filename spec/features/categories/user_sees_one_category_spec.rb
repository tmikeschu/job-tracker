require 'rails_helper'

RSpec.feature "User sees one category" do
  before do
    @category = create(:category_with_jobs)
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