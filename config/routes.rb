Rails.application.routes.draw do


  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  
  root to: 'welcome#home'

  resources :users, except: [:index, :new, :create]


  get 'signup' => 'users#new'
  post 'signup' =>'users#create'
 
  get 'signin' => 'sessions#new' 
  post 'signin' => 'sessions#create'
  post 'signout' =>'sessions#destroy'

  
  resources :games, except: [:destroy] do
    resources :reviews, only: [:new, :create, :index, :edit, :update, :destroy]
  end
  get '/search' => 'games#search'
  resources :categories,only: [:index, :show]
  
 
  
end
