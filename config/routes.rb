Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users do
    collection { get 'search' }
  end
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :new, :create]
  end
end
