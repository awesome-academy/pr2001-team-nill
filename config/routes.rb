# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'book_table', to: 'static_pages#book_table'
  get 'menu', to: 'static_pages#menus'
  get 'signup', to: 'users#new'
  resources :users do
    resources :comments, except: :destroy
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'logout', to: 'sessions#logout'

  resource :sessions, only: %i[new create destroy]
  namespace :admin do
    resources :base
    resources :categories do
    resources :dishes, only: %i[new index create destroy]
    end
    resources :menus
    resources :tables
    resources :users
    resources :books
  end
  resources :categories, only: %i[show index] do
    resources :dishes, only: :index
  end
  resources :dishes, except: :index do
    resources :images, only: %i[show index]
    resources :comments,only: :index
  end
  namespace :search do
    resources :dishes, only: :index
  end
end
