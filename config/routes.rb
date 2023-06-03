# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  resources :users, only: %i[new create]
  resources :leagues, only: %i[new]

  get '/sessions', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'users#create'
  get '/users/dashboard', to: 'users#show'
end
