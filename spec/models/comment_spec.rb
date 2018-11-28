require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:comment) { FactoryBot.create :comment }
  let(:author)      { FactoryBot.create :user }
  let(:movie)       { FactoryBot.create :movie }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(comment).to be_valid
    end

    it 'ensures valid content' do
      expect(comment).to validate_presence_of(:body)
      expect(comment).to validate_length_of(:body).is_at_most(500)
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to :author }
    it { is_expected.to belong_to :movie }
  end
end
