Rails.application.routes.draw do
  root 'static#homepage'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  get '/auth/github/callback' => 'session#create'


  post '/buy_ticket' => 'tickets#create'
  
  resources :festivals

  resources :users

  resources :trucks do
    resources :foods
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
