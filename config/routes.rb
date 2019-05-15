Rails.application.routes.draw do

  resources :articles
  devise_for :users
root 'articles#index'
get 'about', to: 'pages#about'

end
