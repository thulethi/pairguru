class CommentsController < ApplicationController
  before_action :set_movie
  before_action :comment_params, only: :create

  def create
    @comment = @movie.comments.new(comment_params.merge(author: current_user))
    if @comment.save
      flash[:notice] = 'Comment was successfully saved!'
    else
      flash[:error] = 'Comment cannot be empty!'
    end
    redirect_to movie_path(@movie)
  end

  def destroy
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(%i[body author movie])
  end
end
