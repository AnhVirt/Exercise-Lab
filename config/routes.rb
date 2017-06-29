Rails.application.routes.draw do
  get 'users/sign_up'

  
  get 'sessions/new'
  get 'users/index'
  get   'sign_in',   to: 'sessions#new'
  post  'sessions/new', to: 'sessions#create'
  post 'users/sign_up', to: 'users#create'
  get 'sign_up', to: 'users#sign_up'
  delete 'sign_out', to: 'sessions#destroy'
  root 'home#index'

  
  resources :users 	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
