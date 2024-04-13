Rails.application.routes.draw do
  devise_for :psychologists

  resources :evaluatees, only: %i[index new create show]

  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'home#index'
end
