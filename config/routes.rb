Rails.application.routes.draw do

  root "welcome#home"
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  post '/logout' => "sessions#delete"
  resources :users, only: [:new, :create, :show]
  resources :rides, only: :create
  resources :attractions
end


