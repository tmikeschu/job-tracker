require 'rails_helper'

RSpec.feature "User creates a comment" do
  before do
    @company = create(:company_with_jobs)
    @jobs    = @company.jobs
    @job     = @jobs.first
    visit company_path(@company)
    click_on @job.title
  end

  scenario "they create a comment for a job" do
    comment = "Really excited about this one!"
    fill_in "comment_content", with: comment
    click_on "Create Comment"
    expect(current_path).to eq company_job_path(@company, @job)
    expect(page).to have_content comment
  end

  context "when they enter a blank comment" do
    scenario "they see an error message" do
      fill_in "comment_content", with: ""
      click_on "Create Comment"
      expect(current_path).to eq job_comments_path(@job)
      expect(page).to have_content "Whoops! Content can't be blank"
    end
  end
end