Rails.application.routes.draw do
  
  root 'user#home'
  get '/search' => 'posts#search'
  get 'posts/MyQuestions' => 'posts#OwnQuestions'
  resources :posts , :except => [:index]
  devise_for :users, :controllers => { registrations: 'users/registrations' , sessions: 'users/sessions' }
end
