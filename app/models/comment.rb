class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :movie, class_name: 'Movie', foreign_key: 'movie_id'

  validates :body,   presence: :true, length: { maximum: 500 }
  validates :author, uniqueness: { scope: :movie }
end
