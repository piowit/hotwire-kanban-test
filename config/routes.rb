Rails.application.routes.draw do
  resources :boards

  get "up" => "rails/health#show", as: :rails_health_check

  root "boards#index"
end
