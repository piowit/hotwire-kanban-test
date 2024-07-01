Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :boards do
    resources :board_columns, except: [ :index, :show ]
  end

  root "boards#index"
end
