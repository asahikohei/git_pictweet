class UsersController < ApplicationController
  def show
    user = User.find(params[:id]) #current_userを使用すると自身のページにしか遷移しない
    @nickname = user.nickname
    @tweets = user.tweets.order('created_at DESC').page(params[:page]).per(3) #tweetsとはtweetsテーブルの内容全部という意味
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
