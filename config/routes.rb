Rails.application.routes.draw do
  
  get 'photo/title'

  get 'photos/title'

# HOMEPAGE
 
  post 'index' , to: 'homes#create'
  get 'index', to: 'homes#index' 


#SIGN UP UsersController
  get 'sign_up', to:'users#sign_up'
  post 'sign_up', to: 'users#create'

  # get  '/article/:article_id/comment', to: 'comment#new', as: 'comment'
  # post '/article/:article_id/comment', to: 'comment#create', as:'newcomment'

#SessionsController
  
  get   'sign_in',   to: 'sessions#new'
  post  'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
  patch 'users/:id/upload_avatar', to: "users#upload_avatar", as: "users/upload_avatar"

  root 'homes#index'

  
  resources :users do
    resources :photos, only: [:new, :create, :index, :destroy]
  end
  	
  resources :articles do
    resources :comments 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end