Rails.application.routes.draw do
  devise_for :users
  get 'users/sign_out', to: 'devise/sessions#destroy'
  root 'homes#index'
  get '/homes/about', to: 'homes#about'
  get '/homes/introduce', to: 'homes#introduce'
  get '/homes/search', to: 'homes#search'

  # 建物情報登録画面へ
  get '/buildings/new', to: 'buildings#new'
  # 建物登録を行う
  post '/buildings', to: 'buildings#create', as: 'buildings_create'
  # 建物情報一覧画面へ
  get '/buildings', to: 'buildings#index', as: 'buildings_index'
  # 建物情報編集画面へ
  get '/buildings/:id/edit', to: 'buildings#edit' , as: 'buildings_edit'
  # 建物情報更新
  patch '/buildings/:id', to: 'buildings#update', as: 'buildings_update'
  # 建物情報削除
  delete '/buildings/:id', to: 'buildings#destroy', as: 'buildings_destroy'
  # 必要な消防用設備
  get '/buildings/:id/search', to: 'buildings#search', as: 'buildings_search'
  
  
end
