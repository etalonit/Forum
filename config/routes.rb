Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
   scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    resources :users
    root 'articles#index'
    get 'about', to: 'pages#about'
    resources :articles do
      resources :comments
    end
    resources :articles do
     member do
      put "like" =>"articles#upvote"
      put "dislike" =>"articles#downvote"
     end
    end
    resources :categories
  end
  resources :searches
end
