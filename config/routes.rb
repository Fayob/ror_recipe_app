Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#home'
  resources :users, only: [:index]
  resources :foods, except: [:create]
  resources :recipees, except: [:create]
  get '/public_recipes', to: 'recipees#public'
  post '/foods', to: 'foods#create_food'
  post '/recipees', to: 'recipees#create_recipe'

  # Defines the root path route ("/")
  # root "articles#index"
end
