require 'rails_helper'

RSpec.feature 'User updates a job' do
  
  before do
    @company = create(:company_with_jobs)
    @jobs    = @company.jobs
    @job     = @jobs[5]
    visit company_jobs_path(@company)
    click_on @job.title
    click_on "Edit"
  end

  scenario "they update information about a job" do
    new_title = Faker::Name.title
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