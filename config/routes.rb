Rails.application.routes.draw do
  resources :comments
  get 'comments/create'
  get 'fav/update'
  #resources:posts
   # resources :posts 
   #   post 'comments', to:'comments#create'    
  resources :posts do resources :comments end 
  root 'posts#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  #resources :friends
  # not wanna show friends anymore
  #root 'home#index'# home controller and index is home page (index is keyword)
  #get 'home/about' #home controller name , about is function  now not used
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
