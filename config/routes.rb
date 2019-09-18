Rails.application.routes.draw do
  get 'static/new'
  get 'session/new'
  resources :drinks
  resources :foods
  resources :festivals
  resources :trucks
  resources :guests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
