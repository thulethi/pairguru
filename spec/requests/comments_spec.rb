require 'rails_helper'

RSpec.describe 'Comments requests', type: :request do
  let(:selected_movie) {FactoryBot.create :movie, id: rand(1..10) }

  describe 'comments list' do
    comments_count = rand(5..15)
    let!(:comments) { FactoryBot.create_list(:comment, comments_count, movie: selected_movie) }

    it 'displays comments list of selected movie' do
      visit '/movies/' + selected_movie.id.to_s
      expect(page).to have_selector('.comment', count: comments_count)
    end
  end

  before do
    @user = FactoryBot.create(:user, name: 'James Bond', email: 'bond@email.com', password: '12345678')
    @user.confirm
    sign_in(@user)
  end

  describe 'POST /comments' do
    let(:end_point)    { '/movies/' + selected_movie.id.to_s + '/comments' }
    let(:valid_post)   { post end_point, params: { comment: {body: 'Great!'}, movie: selected_movie } }
    let(:invalid_post) { post end_point, params: { comment: {body: nil}, movie: selected_movie } }

    context 'with valid attributes' do
      it 'creates new comment' do
        expect {valid_post}.to change(Comment, :count).by(+1)
      end
    end

    context 'with invalid attributes' do
      it 'fails to create new comment' do
        expect {invalid_post}.to change(Comment, :count).by(0)
      end
    end
  end

  describe 'DELETE /comments' do
  end
end
