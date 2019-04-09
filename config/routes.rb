Rails.application.routes.draw do

root 'pages#main'
get 'about', to: 'pages#about'

end
