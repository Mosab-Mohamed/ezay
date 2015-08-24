Rails.application.routes.draw do
  
  root 'user#home'
  get 'posts/search' => 'posts#search'
  get 'posts/show_cat/:cat' => 'posts#show_cat'
  post 'comments/create' => 'comments#create'
  resources :posts 
  devise_for :users, :controllers => { registrations: 'users/registrations' , sessions: 'users/sessions' }
end
