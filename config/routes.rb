Rails.application.routes.draw do
  root 'festivals#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

  get '/signup' => 'guests#new'
  post '/signup' => 'guests#create'

  post '/make_food' => 'foods#create'
  post '/buy_food' => 'foods#purchase'

  resources :foods
  resources :festivals
  resources :trucks
  resources :guests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
