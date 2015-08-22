Rails.application.routes.draw do
  
  root 'user#home'
  get '/search' => 'posts#search'
  resources :posts , :except => [:index]
  devise_for :users, :controllers => { registrations: 'users/registrations' , sessions: 'users/sessions' }
end
