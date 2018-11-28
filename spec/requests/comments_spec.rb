require 'rails_helper'

RSpec.describe 'Comments requests', type: :request do
  let(:selected_movie) {FactoryBot.create :movie, id: rand(1..10) }

  describe 'comments list' do
    comments_count = rand(5..15)
    let!(:comments) { FactoryBot.create_list(:comment, comments_count, movie: selected_movie) }

    it 'displays comments list of selected movie' do
      visit '/movies/' + selected_movie.id.to_s
      expect(page).to have_selector('h3', text: 'Comments')
      expect(page).to have_selector('.comment', count: comments_count)
    end

    it 'POST /comments'
    it 'DELETE /comments'
  end
end
