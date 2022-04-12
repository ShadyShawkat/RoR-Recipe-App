Rails.application.routes.draw do
  get '/recipes/public', to: 'recipes#public'
  resources :foods
  resources :recipes
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#index'
end
