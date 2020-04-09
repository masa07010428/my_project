Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  get 'homes/about', to: 'homes#about'
end
