Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :houses, only: [:new, :create, :show] do
    resources :tasks, only: [:new, :create]
    resources :gifts, only: [:new, :create]
    resources :habitants, only: [:new, :create]
  end


  resources :gifts, only: [:show, :edit, :update]
  resources :tasks, only: [:show, :edit, :update, :destroy]
  resources :profiles, only: [:show, :new, :create, :edit, :update]

end
