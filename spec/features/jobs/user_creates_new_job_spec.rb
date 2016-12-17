require 'rails_helper'

RSpec.feature "User creates a new job" do
  
  before do
    @categories = create_list(:category, 5)
    @company = Company.create!(name: "ESPN")
    visit company_jobs_path(@company)
    click_on "Add New Job"
  end

  scenario "a user can create a new job" do
    fill_in "job_title", with: "Developer"
    fill_in "job_description", with: "So fun!"
    fill_in "job_level_of_interest", with: 80
    fill_in "job_city", with: "Denver"
    within '#job_category_id' do
      find("option[value='1']").select_option
    end

    click_on "Create Job"

    job = Job.last
    expect(current_path).to eq company_job_path(@company, job)
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_content @categories.first.title
  end

  context "when they submit invalid data" do
    scenario "they see an error" do
      fill_in "job_title", with: ""
      fill_in "job_description", with: ""
      fill_in "job_level_of_interest", with: ""
      fill_in "job_city", with: ""
      within '#job_category_id' do
        find("option[value='#{@categories.first.id}']").select_option
      end

      click_on "Create Job"

      expect(page).to have_content "Whoops! Title can't be blank"
      expect(page).to have_content "Whoops! Level of interest can't be blank"
      expect(page).to have_content "Whoops! City can't be blank"
    end
  end

  context "when they forget to pick a category" do
    scenario "they see an error message" do
      fill_in "job_title", with: "a"
      fill_in "job_description", with: "a"
      fill_in "job_level_of_interest", with: "10"
      fill_in "job_city", with: "blah"
      click_on "Create Job"

      expect(page).to have_content "Whoops! Please enter a category."
    end
  end
end
