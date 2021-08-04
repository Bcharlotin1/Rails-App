Rails.application.routes.draw do


  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  #catches all the infromation from sent from google
  
  resources :users, except: [:index, :new, :create]
  post 'delete_account' =>'users#destroy'
  
  root to: 'welcome#home'
  get 'signin' => 'sessions#new' 
  post 'signin' => 'sessions#create'
  post 'signout' =>'sessions#destroy'

  get 'signup' => 'users#new'
  post 'signup' =>'users#create'
  
  resources :games

  resources :games, only: [:show] do
    resources :reviews, except: [:new, :create, :index]
  end

  resources :categories
  
  get '/search' => 'games#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
