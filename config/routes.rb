Showfinder::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  get '/profile' => "users#profile", as: :user_profile

  resources :bands

  resources :venues

  resources :shows
  
end
