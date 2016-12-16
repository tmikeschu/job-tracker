=begin 
As a user
assuming there is a company and jobs in the database
if I visit a company page
and visit an individual job page by clicking its title
and click "Edit"
and update the job's info
and click "Update"
I will be back on the show page
and the displayed information will be updated
=end

require 'rails_helper'

RSpec.feature 'User updates a job' do
  
  before do
    @company = create(:company_with_jobs)
    @jobs    = @company.jobs
    @job     = @jobs[5]
  end

  scenario "they update information about a job" do
    new_title = Faker::Name.title
    visit company_jobs_path(@company)
    click_on @job.title
    click_on "Edit"
    fill_in "job_title", with: new_title
    fill_in "job_description", with: Faker::Lorem.sentence
    fill_in "job_level_of_interest", with: (rand(99) + 1)
    fill_in "job_city", with: Faker::Address.city
    click_on "Update Job"
    expect(current_path).to eq company_job_path(@company, @job)
    expect(page).to_not have_content @job.title
    expect(page).to have_content new_title
  end

  context "they input invalid data" do
    scenario "and they see an error" do
      visit company_jobs_path(@company)
      click_on @job.title
      click_on "Edit"
      fill_in "job_title", with: ""
      fill_in "job_level_of_interest", with: ""
      fill_in "job_city", with: ""
      click_on "Update Job"
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "City can't be blank"
      expect(page).to have_content "Level of interest can't be blank"
    end
  end

end