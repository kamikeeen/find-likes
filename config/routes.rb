Rails.application.routes.draw do
  devise_for :users
  root "likes#index"

  resources :likes, only: [:index, :new, :create, :show] do
    member do
      get "add", to: "likes#add"
    end
  end

  resources :users, only: [:show] 
  resources :relationships, only: [:create, :destroy]


  namespace :api do
    get "likes/search"
    get "likes/select_genre"
  end
end