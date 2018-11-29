class UsersController < ApplicationController
  def top_commenters
    @top_commenters = User.joins(:comments)
                          .where("comments.created_at": ((Time.zone.now - 7.days)..Time.zone.now))
                          .select("users.id, users.name, COUNT(comments.id) AS comments_amount")
                          .group("author_id")
                          .order("comments_amount DESC")
                          .limit(10)
  end
end
