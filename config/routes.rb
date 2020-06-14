Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets, only: [:new, :create, :destroy, :edit, :update]
  resources :users, only: [:show, :destroy, :edit, :update]
end
