Rails.application.routes.draw do
  get 'houses/index'
  devise_for :users
  root to: 'houses#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :house, only: [:new, :create, :show]

  resources :profiles, except: [:index]

  get "/dashboard", to: "pages#dashboard"

end
