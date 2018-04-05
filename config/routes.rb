Rails.application.routes.draw do

  resources :passengers do
    resources :trips, only: [:new, :create, :index]
  end

  resources :trips, except: [:new, :create]

  resources :drivers


  get 'user_interfaces', to: 'user_interfaces#index', as: 'user_interfaces'

  # get 'passengers', to: 'passengers#index', as: 'passengers'
  #
  # get 'passengers/new', to: 'passengers#new', as: 'new_passenger'
  #
  # get 'passengers/:id', to: 'passengers#show', as: 'passenger'
  #
  # post 'passengers', to: 'passengers#create'
  #
  # get 'passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
  #
  # patch 'passengers/:id', to: 'passengers#update'
  #
  # delete 'passengers/:id', to: 'passengers#destroy', as: 'delete_passenger'
  #
  # get 'drivers', to: 'drivers#index', as: 'drivers'
  #
  # get 'drivers/new', to: 'drivers#new', as: 'new_driver'
  #
  # get 'drivers/:id', to: 'drivers#show', as: 'driver'
  #
  # post 'drivers', to: 'drivers#create'
  #
  # get 'drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
  #
  # patch 'drivers/:id', to: 'drivers#update'
  #
  # delete 'drivers/:id', to: 'drivers#destroy', as: 'delete_driver'
  #
  # patch 'drivers/:id/status', to: 'drivers#status', as: 'update_status'
  #
  # get 'trips', to: 'trips#index', as: 'trips'
  #
  # get 'trips/new', to: 'trips#new', as: 'new_trip'
  #
  # get 'trips/:id', to: 'trips#show', as: 'trip'
  #
  # post 'trips', to: 'trip#create'
  #
  # get 'trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  #
  # patch 'trips/:id', to: 'trips#update'
  #
  # delete 'trips/:id', to: 'trips#destroy', as: 'delete_trip'

  root 'user_interfaces#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
