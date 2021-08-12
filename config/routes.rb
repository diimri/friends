Rails.application.routes.draw do
  get 'fav/update'
  resources :comments
  resources :posts
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
