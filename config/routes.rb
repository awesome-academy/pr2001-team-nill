Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'chefs', to: 'static_pages#chefs'
  get 'book_table', to: 'static_pages#book_table'
  get 'menu',to:'static_pages#menus'
  get 'signup', to: 'users#new'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: "sessions#logout"
  resources :menus, :except => [:index] do
      resources :meals, :except => [:index]
    end
  resource :sessions, only: [:new, :create, :destroy]

  end
