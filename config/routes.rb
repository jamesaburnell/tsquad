Rails.application.routes.draw do
  resources :accounts
  devise_for :users
  root 'home#index'
end
