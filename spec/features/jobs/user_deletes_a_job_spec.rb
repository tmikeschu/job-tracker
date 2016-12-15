=begin 
As a user
Assuming there is a job in the database
When I visit the jobs index of a company
and click to an individual job
and I click "Delete"
I am taken back to the jobs index
and the deleted job is not on the page.
=end

require 'rails_helper'

RSpec.feature 'User deletes a job' do
  
  before do
    @company = create(:company_with_jobs)
    @jobs    = @company.jobs
    @job     = @jobs[4]
  end

  scenario 'they delete a job and return to index page' do
    visit company_jobs_path(@company)
    click_on @job.title
    click_on "Delete"
    expect(current_path).to eq jobs_path
    expect(page).to_not have_link @job.title, href: job_path(@job)
  end
end