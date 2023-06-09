# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'users#create'
  get '/sessions', to: 'sessions#create'
  delete 'sessions/logout', to: 'sessions#destroy'
  get '/users/dashboard', to: 'users#show'
  post '/draft_team', to: 'draft_facade#draft_team', as: 'draft_team'

  resources :users, only: %i[create]
  resources :leagues, only: %i[new create show] do
    get '/draft', to: 'leagues#draft'
  end

  # resources :user_leagues, only: %i[show]
  get '/user_leagues', to: 'user_leagues#create'
  get '/user_league', to: 'user_leagues#show'
end