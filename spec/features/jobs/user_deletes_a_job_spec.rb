=begin 
As a user
Assuming their is a job in the database
When I visit the jobs index
and click to an individual job
and I click "Delete"
I am taken back to the jobs index
and the deleted job is not on the page.
=end

require 'rails_helper'

RSpec.feature 'User deletes a job' do
  
  before do
    @jobs = create_list(:job, 10)
    @job  = @jobs[4]
  end

  scenario 'they delete a job and return to index page' do
    visit jobs_path
    click_on @job.title
    click_on "Delete"
    expect(current_path).to eq jobs_path
    expect(page).to_not have_link @job.title, href: job_path(@job)
  end
end