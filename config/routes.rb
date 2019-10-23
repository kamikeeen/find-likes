Rails.application.routes.draw do
  devise_for :users
  root "likes#index"

  resources :likes, only: [:index, :new, :create]
end
