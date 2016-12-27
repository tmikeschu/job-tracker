require 'rails_helper'

RSpec.feature "User creates a comment" do
  before do
    @user = create(:full_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @company = @user.companies.first
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

  context "when multiple comments exist" do
    scenario "they are listed in reverse chronological order" do
      comment = "Really excited about this one!"
      fill_in "comment_content", with: comment
      click_on "Create Comment"
      comment2 = "Reallllllly excited about this one!"
      fill_in "comment_content", with: comment2
      click_on "Create Comment"
      expect(page.find("#comment-list:nth-child(1)").text).to have_content comment2
      expect(page.find("#comment-list:nth-child(2)").text).to have_content comment
    end
  end
end