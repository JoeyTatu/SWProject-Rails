Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'
  
  resources :users
  
  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  #get 'sessions/create'
  #get 'sessions/login'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end