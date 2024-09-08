Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create]
    resources :reactions, only: [:create]
  end
  root 'posts#index'
end
