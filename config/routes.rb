Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#home'
  resources :users, only: [:index]
  resources :food

  # Defines the root path route ("/")
  # root "articles#index"
end
