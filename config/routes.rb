Rails.application.routes.draw do
  
  root 'user#home'
  get 'posts/search' => 'posts#search'
  resources :posts , :except => [:index]
  devise_for :users
end
