Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"


  resources :items, only: [:create, :new, :index, :show, :edit, :update, :destroy]
end
