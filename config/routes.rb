# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
  post 'pusher/auth', to: 'pusher#auth'
  resources :chats, only: %i[index create]
end
