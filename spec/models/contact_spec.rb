require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_uniqueness_of(:email)}
  end

  describe "associations" do
    it {should belong_to(:company)}
    it {should belong_to(:user)}
  end
end
