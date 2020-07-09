Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :activities, only: [:index]
    resources :babies, only: [:index] do
      resources :activity_logs, only: [:index]
    end
  end
end
