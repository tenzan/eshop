Rails.application.routes.draw do

  namespace :admin do
    root "application#index"

    resources :products, only: [:new, :create, :edit, :update, :destroy]
    resources :users
  end

  devise_for :users

  root :to => 'products#index'

  resources :products, only: [:index, :show]
end
