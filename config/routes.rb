Rails.application.routes.draw do
  devise_for :users
  get 'users/sign_out', to: 'devise/sessions#destroy'
  root 'homes#index'
  get '/homes/about', to: 'homes#about'
  get '/homes/introduction', to: 'homes#introduction'
  get '/homes/search', to: 'homes#search'

  resources :buildings
end

