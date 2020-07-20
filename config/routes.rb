# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'chefs', to: 'static_pages#chefs'
  get 'book_table', to: 'static_pages#book_table'
  get 'menu', to: 'static_pages#menus'
  get 'signup', to: 'users#new'
  get 'reviews', to: 'reviews#show'
  resources :users do
    resources :reviews, only: %i[index show update]
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#logout'

  resource :sessions, only: %i[new create destroy]
  namespace :admin do
    resources :base
    resources :categories do 
    resources :dishes
    end
    resources :menus
    resources :tables
    resources :users
    resources :books
  end
  resources :categories, only: %i[show index] do
    resources :dishes
  end
  resources :dishes, only: [] do
    resources :images, only: %i[new index create destroy]
  end
end
