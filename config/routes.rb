Rails.application.routes.draw do
  resources :projects
  resources :daily_updates
  resources :leaves
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  # root "user_dashboard#index" 
  resources :employees
  # post 'create', to: 
  get '/tables', to: 'home#tables'
  post 'change_role', to: 'employees#change_role'
  # get 'edit', to: 'employess#edit'
  # patch 'update', to: 'employees#update'
  # get 'demo', to: 'users#new_user'
  # post 'test', to: 'users#create_user'
  # Defines the root path route ("/")
  # root "articles#index"
end
