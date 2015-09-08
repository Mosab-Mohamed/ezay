Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'user#home'
  get '/posts/search' => 'posts#search'
  get 'posts/show_cat/:cat' => 'posts#show_cat'
  get 'posts/write' => 'posts#write'
  post 'comments/create' => 'comments#create'
  get 'comments/edit' => 'comments#edit'
  get 'comments/updateBody/:id' => 'comments#updateBody'
  get '/notifications/Notifications_show' => 'notifications#Notifications_show'
  post 'posts/:id' => 'posts#update'
  delete 'comments/delete/:comment_id' => 'comments#delete'
  get '/notifications/check_updates' => 'notifications#checkForupdates'
  get 'user/deactivate' => 'user#deactivate'
  get '/posts/:id/like' => 'posts#like'
  get '/posts/:id/unlike' => 'posts#unlike'
  get '/comments/:id/like' => 'comments#like'
  get '/comments/:id/dislike' => 'comments#dislike'
  get 'user/:id' => 'user#show_profile'
  get 'user/:id/follow' => 'user#follow'
  get 'user/:id/unfollow' => 'user#unfollow'
  get '/newsFeed' => 'user#newsFeed'
  get 'user/:id/message' => 'message#msg_form'
  get '/MyMessages' => 'message#msg_show'
  get '/user/:id/message_sent' => 'message#create'
  
  resources :posts 
  devise_for :users, :controllers => { registrations: 'users/registrations' , sessions: 'users/sessions' }
end
