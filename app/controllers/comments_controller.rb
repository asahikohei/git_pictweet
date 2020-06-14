class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to tweet_path(@comment.tweet.id) #コメントされたツイートの詳細画面に戻るprefix
  end
  
  private
  def comment_params
    params.permit(:text, :tweet_id).merge(user_id: current_user.id)
  end
end
