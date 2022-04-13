Rails.application.routes.draw do
  get '/recipes/public', to: 'recipes#public'
  get '/foods/new(/:recipe_id)', to: 'foods#new'
  resources :foods
  resources :recipes
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'recipes#index'
end
