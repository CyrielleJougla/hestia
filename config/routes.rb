Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :houses, only: [:new, :create, :show] do
    resources :tasks, except: [:edit, :update]
    resources :gifts, except: [:destroy, :index, :show]
    resources :habitants, only: [:new, :create]
  end

  resources :gifts, only: [:show]
  resources :tasks, only: [:edit, :update]

  resources :profiles, only: [:show, :new, :create, :edit, :update]

end
