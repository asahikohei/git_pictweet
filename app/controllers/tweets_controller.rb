class TweetsController < ApplicationController
  before_action :redirect_to_index, except: :index
  
    def index
      @tweets = Tweet.all.includes(:user).order('created_at DESC').page(params[:page]).per(3)
    end
    
    def new
    end
    
    def create
      Tweet.create(create_params)
      redirect_to :root
    end
    
    private
    def create_params
      params.permit(:text, :image).merge(user_id: current_user.id)
    end
    
    private
    def redirect_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end
