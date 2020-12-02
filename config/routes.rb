Rails.application.routes.draw do

  devise_for :users
  root to: 'houses#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :houses, only: [:new, :create, :show] do
    resources :tasks
    resources :gifts, except: [:destroy, :index]
  end

  resources :profiles, only: [:show, :new, :create, :edit, :update]

end
