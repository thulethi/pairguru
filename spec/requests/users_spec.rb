require 'rails_helper'

RSpec.describe 'Users requests', type: :request do
  describe 'top commenters last week' do
    users_count = rand(2..15)
    let!(:users) { FactoryBot.create_list(:user, users_count, :with_comments) }

    before { visit '/top_commenters' }

    it 'displays right title' do
      expect(page).to have_selector('h1', text: 'Top commenters of the week')
    end

    it 'display a table of top 10 commenters' do
      if users_count < 10
        expect(page).to have_selector('.top-commenter', count: users_count)
      else
        expect(page).to have_selector('.top-commenter', count: 10)
      end
    end
  end
end
