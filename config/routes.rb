Rails.application.routes.draw do
  # get 'password_resets/new'
  #
  # get 'password_resets/edit'

  resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'products#index'

  get 'products/:id', to: 'products#show', as: 'product'

  get '/signup', to: 'users#new'
  resources :users

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  namespace :admin do
    resources :products
    resources :users
    resources :kinds
    resources :purveyors
    resources :brands
    resources :types
    resources :comments
    root to: 'products#index'
  end

  get '/comments/new', to: 'comments#new'
  post 'comments', to: 'comments#create'
  get '/comments/:id/edit', to: 'comments#edit', as: 'comments_edit'

end
