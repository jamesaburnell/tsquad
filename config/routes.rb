Rails.application.routes.draw do
  resources :accounts do
  	get '/favorite_tweet', to: "accounts#favorite_tweet"
  end
  devise_for :users
  root 'home#index'
end
