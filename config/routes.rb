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
  resources :categories, only: %i[show index] do
    resources :dishes
  end
  resources :dishes do
    resources :images, only: %i[new index create destroy]
  end

  namespace :search do
    resources :dishes, only: :index
  end
end
