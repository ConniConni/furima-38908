Rails.application.routes.draw do
  get 'item/edit'
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  
  resources :items do
   resources :orders, only: [:index, :create]
  end
  resources :destinations, only: [:index]

end
