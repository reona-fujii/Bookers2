Rails.application.routes.draw do
  
  root 'homes#top'
  get 'homes/about'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :destroy, :edit, :index, :update, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
