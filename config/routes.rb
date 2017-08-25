Rails.application.routes.draw do
  
#SIGN UP accountsController

  # get  '/article/:article_id/comment', to: 'comment#new', as: 'comment'
  # post '/article/:article_id/comment', to: 'comment#create', as:'newcomment'

#SessionsController
  
  get   'sign_in',   to: 'sessions#new'
  post  'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
  patch 'accounts/:id/upload_avatar', to: "accounts#upload_avatar", as: "accounts/upload_avatar"
  patch 'accounts/:id/upload_wallpaper', to: "accounts#upload_wallpaper", as: "accounts/upload_wallpaper"

  resources :friendships,only:[:create,:update,:destroy,:edit]
  resources :accounts,param: :username do
     
    member do 
      get :friends
    end
    resources :photos, only: [:new, :create, :show, :destroy]
  end
  get 'sign_up', to:'accounts#sign_up'
  post 'sign_up', to: 'accounts#create'
  
  resources :articles do
    resources :comments 
  end
  get 'articles/:id/show_comments',to: 'articles#show_comments',as: 'articles/show_comments'
  patch 'articles/:id/update_data',to: 'articles#update_data',as: 'articles/update_data'
  resources :messages
  resources :talks,only: [:create,:update,:destroy,:index,:new,:show]
  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
