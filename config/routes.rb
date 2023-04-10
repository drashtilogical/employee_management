Rails.application.routes.draw do
  root "home#index"
  resources :projects
  resources :daily_updates
  resources :leaves do
    member do
      patch 'update_status'
    end
  end
  devise_for :users
  resources :employees
  get '/tables', to: 'home#tables'
  post 'change_role', to: 'employees#change_role'
  # get 'edit', to: 'employess#edit'
  # patch 'update', to: 'employees#update'
  # get 'demo', to: 'users#new_user'
  # post 'test', to: 'users#create_user'
  # Defines the root path route ("/")
  # root "articles#index"
end
