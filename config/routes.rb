Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "todos#index"
  resources :users, only: [:edit, :update]
  resources :todos, only: [:new, :create, :edit, :update, :destroy]
end
