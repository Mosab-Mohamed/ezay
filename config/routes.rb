Rails.application.routes.draw do
  
  root 'user#home'
  get 'posts/search' => 'posts#search'
  get 'posts/show_cat/:cat' => 'posts#show_cat'
  post 'comments/create' => 'comments#create'
  get '/notifications/Notifications_show' => 'notifications#Notifications_show'
  resources :posts 
  devise_for :users, :controllers => { registrations: 'users/registrations' , sessions: 'users/sessions' }
end
