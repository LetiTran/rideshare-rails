Rails.application.routes.draw do

  get 'passengers', to: 'passengers#index', as: 'passengers'

  get 'passengers/new', to: 'passengers#new', as: 'new_passenger'

  get 'passengers/new', to: 'passengers#new', as: 'new_passenger'

  post 'passengers/create', to: 'passenger#create'

  get 'passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'

  patch 'passengers/:id', to: 'passengers#update'

  delete 'passengers/:id', to: 'passengers#destroy'

  get 'drivers', to: 'drivers#index', as: 'drivers'

  get 'drivers/new', to: 'drivers#new', as: 'new_driver'

  get 'drivers/new', to: 'drivers#new', as: 'new_driver'

  post 'drivers/create', to: 'driver#create'

  get 'drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'

  patch 'drivers/:id', to: 'drivers#update'

  delete 'drivers/:id', to: 'drivers#destroy'

  patch 'drivers/:id/status', to: 'drivers#status', as: 'update_status'

  get 'trips', to: 'trips#index', as: 'trips'

  get 'trips/new', to: 'trips#new', as: 'new_trip'

  get 'trips/new', to: 'trips#new', as: 'new_trip'

  post 'trips/create', to: 'trip#create'

  get 'trips/:id/edit', to: 'trips#edit', as: 'edit_trip'

  patch 'trips/:id', to: 'trips#update'

  delete 'trips/:id', to: 'trips#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
