Rails.application.routes.draw do
  
  resources :attractions
  resources :rides
  resources :users

  get "/logout" => 'users#logout'
  root 'users#homepage'
  get "/signin" => 'users#signin'
  post "/signin" => 'users#authorize', as: 'login'
  post '/rides/new' => 'rides#new'
  # post "/users/:id" => 'users#adjust'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
