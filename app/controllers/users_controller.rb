class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @tweets = current_user.tweets.order('created_at DESC').page(params[:page]).per(3) #tweetsとはtweetsテーブルの内容全部という意味
  end
end
