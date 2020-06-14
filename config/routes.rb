Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets, only: [:new, :create, :destroy]
  resources :users, only: [:show, :destroy]
end
