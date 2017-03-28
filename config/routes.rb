Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'

  get 'products/:id', to: 'products#show', as: 'product'

  namespace :admin do
    resources :products
    resources :users
    resources :kinds
    resources :purveyors
    resources :brands
    resources :types
  end
end
