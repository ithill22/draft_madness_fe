# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  resources :users, only: %i[create]
  resources :leagues, only: %i[new create show] do
    get '/draft', to: 'leagues#draft'
  end
  resources :user_leagues, only: %i[show]
  get '/user_leagues', to: 'user_leagues#create'
  get '/sessions', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'users#create'
  get '/users/dashboard', to: 'users#show'
end
