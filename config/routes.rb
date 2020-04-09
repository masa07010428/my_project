Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  get 'homes/about', to: 'homes#about'
  get 'homes/introduce', to: 'homes#introduce'
  get 'homes/search', to: 'homes#search'

end
