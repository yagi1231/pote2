Rails.application.routes.draw do


  get 'tops/index'
  get 'reservations/index'
  resources :tops
  resources :posts
  get "posts/index" => "posts#index"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/new" => "posts#new"
  post "posts/new" => "posts#new"
  
  resources :users
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "signup" => "users#new"

  resources :reservations
 
  post "reservations/new" => "reservations#new"
  post "reservations/create" => "reservations#create"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end