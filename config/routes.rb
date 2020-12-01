Rails.application.routes.draw do
  get 'houses/show'
  devise_for :users
  root to: 'houses#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :houses, only: [:new, :create, :show]

  resources :profiles, except: [:index]

  resources :gifts, except: [:index, :destroy]

  get "/dashboard", to: "pages#dashboard"

end
