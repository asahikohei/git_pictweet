class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @tweets = current_user.tweets #tweetsとはtweetsテーブルの内容全部という意味
  end
end
