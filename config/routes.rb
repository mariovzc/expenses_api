Rails.application.routes.draw do
  apipie
  resources :users, only: :create do
    collection do
      post :login
    end
  end
end
