# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  resources :users, only: %i[new create]

  get '/auth/:provider/callback', to: 'sessions#create'

  # post '/auth/google_oauth2', to: 'users#create'

  get '/users/dashboard', to: 'users#dashboard'
end

# /users/dashboard