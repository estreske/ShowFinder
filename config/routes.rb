Showfinder::Application.routes.draw do
  devise_for :users 

  devise_scope :user do
    get "/sign_out" => "devise/sessions#destroy"

  end

  root :to => "home#index"

  get '/profile' => "users#profile", as: :user_profile

  get '/welcome' => "home#welcome", as: :welcome

  get '/shows/city' => "shows#city"

  resources :bands

  resources :venues

  resources :shows

  resources :requests
  
end
