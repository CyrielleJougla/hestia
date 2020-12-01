Rails.application.routes.draw do

  devise_for :users
  root to: 'houses#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :house, only: [:index, :new, :show] do
    resources :task
  end

  resources :profiles, except: [:index]

  get "/dashboard", to: "pages#dashboard"

end
