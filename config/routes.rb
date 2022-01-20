Rails.application.routes.draw do
  resources :products, only: [:index] do
    collection do
      post :add_to_cart
    end
  end
  root to: 'products#index'
end
