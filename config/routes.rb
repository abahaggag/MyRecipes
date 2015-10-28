Rails.application.routes.draw do
  get '/home', to: 'pages#home'
  
  resources :recipes
  root 'pages#home'
end
