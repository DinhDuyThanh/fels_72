Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :categories, only: :index
  resources :words
  resources :users do
    resources :followings, only: :index
    resources :followers, only: :index
  end
  resources :relationships, only: [:create, :destroy]
end
