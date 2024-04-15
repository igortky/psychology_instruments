Rails.application.routes.draw do
  devise_for :psychologists

  resources :evaluatees, except: %i[destroy] do
    resources :assessments, only: %i[new create show] do
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
  devise_scope :psychologist do
    root to: 'devise/sessions#new'
  end
end
