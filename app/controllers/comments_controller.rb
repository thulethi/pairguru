class CommentsController < ApplicationController
  before_action :set_movie

  def create
  end

  def destroy
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
