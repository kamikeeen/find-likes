Rails.application.routes.draw do
  devise_for :users
  root "likes#index"

  resources :likes, only: [:index, :new, :create, :show] do
    member do
      get "add", to: "likes#add"
    end
  end

  resources :users, only: [:show] 


  namespace :api do
    get "likes/search"
  end
end