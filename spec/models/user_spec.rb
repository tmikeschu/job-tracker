require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it {should have_many(:jobs)}
    it {should have_many(:contacts)}
  end
end