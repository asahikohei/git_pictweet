class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @tweets = Tweet.where(user_id: current_user.id)
  end
end
