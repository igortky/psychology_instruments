Rails.application.routes.draw do
  devise_for :psychologists

  resources :evaluatees, except: %i[destroy] do
    resources :assessments, only: %i[new create] do
      member do
        get :start
        post :submit
        get :questions
        post :submit_answers
        get :complete
      end
    end
    resources :instruments, except: :delete
  end

  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'home#index'
end
