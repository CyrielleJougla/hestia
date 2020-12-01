Rails.application.routes.draw do
  get 'houses/show'
  devise_for :users
  root to: 'houses#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :houses, only: [:new, :create, :show] do
    resources :gifts, except: [:destroy, :index]
  end

  resources :profiles, except: [:index]


  get "/dashboard", to: "pages#dashboard"

end
