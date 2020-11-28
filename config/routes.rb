Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :reservations, only: %w(index)
  resources :guests, only: %w(index)

  namespace :integrations do
    resources :service_a, only: %w(create)
    resources :service_b, only: %w(create)
  end
end
