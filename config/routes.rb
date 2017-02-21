Rails.application.routes.draw do

  namespace :admin do
    root "application#index"

    resources :products, only: [:new, :create, :edit, :update, :destroy]
    resources :users do
      member do
        patch :archive
      end
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  root :to => 'products#index'

  resources :products, only: [:index, :show]
end
