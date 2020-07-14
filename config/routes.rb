# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'chefs', to: 'static_pages#chefs'
  get 'book_table', to: 'static_pages#book_table'
  get 'menu', to: 'static_pages#menus'
  get 'signup', to: 'users#new'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#logout'
  resource :sessions, only: %i[new create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :base
    resources :categories do 
      resources :dishes
    end
    resources :menus do
      resources :menu_dishes
    end
  end
end
