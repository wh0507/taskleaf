Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
  end
  resources :users
end
