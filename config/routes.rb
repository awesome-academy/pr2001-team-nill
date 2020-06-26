Rails.application.routes.draw do
  resources :microposts
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'chefs', to: 'static_pages#chefs'
  get 'book_table', to: 'static_pages#book_table'
  get 'food_menu',to:'static_pages#food_menu'
  get 'signup', to: 'users#signup'
  get 'signin', to: 'users#signin'
  resources :microposts
  resources :users

end
