Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  get 'items/index'
  devise_for :users
  root to: "items#index"

  resources :articles
  resources :items, only: [:create, :new]
end
