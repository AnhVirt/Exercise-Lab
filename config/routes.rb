Rails.application.routes.draw do
  
 
  devise_scope :user do
    devise_for :users ,path_names: {
      sign_in: 'login',sign_out:'logout',
      sign_up: 'sign_up'
    }
    resources :users 
    get 'users/:id/friends',to:'users#friends',as:'friends'
  end
 
  resources :friendships,only:[:create,:update,:destroy,:edit]
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
