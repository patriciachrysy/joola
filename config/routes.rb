Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }

  get 'home/index'

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
