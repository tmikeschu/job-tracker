require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it {should have_many(:jobs)}
    it {should have_many(:contacts)}
    it {should have_many(:companies)}
    it {should have_many(:categories)}
  end

  describe "validations" do
    it {should validate_presence_of(:first_name)}

    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}

    it {should validate_presence_of(:password)}
    it {should validate_length_of(:password).is_at_least(10).is_at_most(50)}
    end
end