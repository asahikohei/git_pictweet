class TweetsController < ApplicationController
    def index
      @tweets = Tweet.all
    end
    
    def new
    end
    
    def create
      Tweet.create(create_params)
      redirect_to :root
    end
    
    private
    def create_params
      params.permit(:name, :text, :image)
    end
end
