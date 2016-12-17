require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it {is_expected.to validate_presence_of(:content)}
  end

  context 'associations' do
    it {should belong_to(:job)}
  end
end
