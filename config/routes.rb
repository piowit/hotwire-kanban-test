Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :boards, shallow: true do
    resources :board_columns, except: [ :index, :show ] do
      member do
        put :update_card_positions
      end
    end
  end

  resources :cards,  except: [ :index ]

  root "boards#index"
end
