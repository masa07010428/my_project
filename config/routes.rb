Rails.application.routes.draw do
  devise_for :users
  get 'users/sign_out', to: 'devise/sessions#destroy'
  root 'homes#index'
  get '/homes/about', to: 'homes#about'
  get '/homes/introduce', to: 'homes#introduce'
  get '/homes/search', to: 'homes#search'

  resources :buildings
  # 必要な消防用設備
  get '/buildings/:id/search', to: 'buildings#search', as: 'buildings_search'
end

