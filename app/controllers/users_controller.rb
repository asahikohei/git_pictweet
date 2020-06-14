class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @tweets = current_user.tweets.order('created_at DESC').page(params[:page]).per(3) #tweetsとはtweetsテーブルの内容全部という意味
  end
  
  def destroy
    tweet = Tweet.find(params:[id])
    if current_user.id == tweet.user_id
      tweet.destroy
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id == current_user.id
      @tweet.update(tweet_params)
    end
  end
  
  private
  def tweet_params
    params.permit(:image, :text).merge(user_id: current_user.id)
  end
  
end
