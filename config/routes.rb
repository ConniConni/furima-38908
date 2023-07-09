Rails.application.routes.draw do
  get 'item/edit'
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  
  resources :items, only: [:index, :new, :create, :show, :edit, :update]

end
