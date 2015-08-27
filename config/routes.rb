Rails.application.routes.draw do
  
  root 'user#home'
  get '/posts/search' => 'posts#search'
  get 'posts/show_cat/:cat' => 'posts#show_cat'
  get 'posts/write' => 'posts#write'
  post 'comments/create' => 'comments#create'
  get '/notifications/Notifications_show' => 'notifications#Notifications_show'
  post 'posts/:id' => 'posts#update'
  delete 'comments/delete/:comment_id' => 'comments#delete'
  get '/notifications/check_updates' => 'notifications#checkForupdates'
  resources :posts 
  devise_for :users, :controllers => { registrations: 'users/registrations' , sessions: 'users/sessions' }
end
