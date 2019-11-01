Rails.application.routes.draw do
  devise_for :users
  root "likes#index"

  resources :likes, only: [:index, :new, :create, :show]

  resources :users, only: [:show] 
  resources :relationships, only: [:create, :destroy]


  namespace :api do
    get "likes/search"
    get "likes/select_genre"
    post "users/add_like"
    delete "users/delete_like"
  end
end