Rails.application.routes.draw do

  devise_for :users
  root to: 'houses#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :houses, only: [:new, :create, :show] do
    resources :task
  end

  resources :profiles, only: [:show, :edit, :update]


end
