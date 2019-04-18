Rails.application.routes.draw do

  resources :articles
  devise_for :users
root 'pages#main'
get 'about', to: 'pages#about'


end
