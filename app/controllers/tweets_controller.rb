class TweetsController < ApplicationController
  before_action :redirect_to_index, except: :index
  
    def index
      @tweets = Tweet.all.includes(:user).order('created_at DESC').page(params[:page]).per(3)
    end
    
    def new
    end
    
    def create
      Tweet.create(tweet_params)
      redirect_to :root
    end
    
    def destroy
      tweet = Tweet.find(params[:id])
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
    
    def show
      @tweet = Tweet.find(params[:id])
      @comments = @tweet.comments.includes(:user)
    end
    
    
    private
    def tweet_params
      params.permit(:text, :image).merge(user_id: current_user.id)
    end
    
    private
    def redirect_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end
