Rails.application.routes.draw do
  
  get 'pizzasgit/status'

  devise_for :users
  
  resources :restaurants do
  	resources :pizzas
  end

  root 'restaurants#index'
end
