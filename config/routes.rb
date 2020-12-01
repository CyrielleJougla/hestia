Rails.application.routes.draw do
  get 'houses/index'
  devise_for :users
  root to: 'houses#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :house, only: [:index,:new, :create]
=======
  resources :profiles, except: [:index]
>>>>>>> 64565a11bd0354f3e9177ea59b11d692cf4e3e58
end
