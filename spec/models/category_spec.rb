require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_uniqueness_of(:title)}
  end

  context 'associations' do
    it {should have_many(:jobs)}
    it {should belong_to(:user)}
  end
end
