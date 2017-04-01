Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'

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
  end

  get '/comments/new', to: 'comment#new'
  post 'comments', to: 'comment#create'
  get '/comments/:id/edit', to: 'comment#edit', as: 'comments_edit'

end
