Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :boards, shallow: true do
    resources :board_columns, except: [ :index, :show ] do
      resources :cards,  only: [ :new, :create ]
    end
  end


  root "boards#index"
end
