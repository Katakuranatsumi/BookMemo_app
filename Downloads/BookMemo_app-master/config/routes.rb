Rails.application.routes.draw do
  resources :allmemos
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'    
  get 'sessions/new'
  namespace :admin do
    resources :users
  end
  root to: 'memos#index'
  resources :memos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
