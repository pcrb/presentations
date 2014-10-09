Rails.application.routes.draw do
  resources :things do
    post :update_display_order, on: :collection
  end
end
