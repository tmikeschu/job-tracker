=begin 
As a user
given a job exists in the database
If I go to that job page
and fill in a comment
and click "Add Comment"
then the page reloads
and I can see that new comment on the job page
=end

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
    click_on "Add Comment"
    expect(current_path).to eq company_job_path(@company, @job)
    expect(page).to have_content comment
  end
end