Rails.application.routes.draw do
  root 'static#new'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'




  resources :foods
  resources :festivals
  resources :trucks
  resources :guests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
