require 'rails_helper'

RSpec.describe JobsHelper, type: :helper do
  before do
    @user = create(:full_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @jobs = @user.jobs
  end

  describe "full_name" do
    it "returns a first and last name" do
      contact = create(:contact)
      expect(helper.full_name(contact)).to eq contact.first_name + " " + contact.last_name.capitalize
    end
  end

  describe "jobs_in_city" do
    it "returns a collection of jobs in a given city" do
      city = @jobs.first.city
      jobs_city = @jobs.find_all {|job| job.city == city }
      expect(helper.jobs_in_city(city)).to eq jobs_city
    end
  end

  describe "jobs_with_level_of_interest" do
    it "returns jobs for a given level of interest" do
      level = @jobs.first.level_of_interest
      jobs_level = @jobs.find_all {|job| job.level_of_interest == level}
      expect(helper.jobs_with_level_of_interest(level)).to eq jobs_level
    end
  end
end