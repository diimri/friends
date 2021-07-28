Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :friends
  root 'home#index'# home controller and index is home page (index is keyword)
  get 'home/about' #home controller name , about is function
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
