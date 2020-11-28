Rails.application.routes.draw do
  root 'reservations#index'

  resources :reservations, only: %w(index)

  namespace :integrations do
    resources :service_a, only: %w(create)
    resources :service_b, only: %w(create)
  end
end
