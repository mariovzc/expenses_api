Rails.application.routes.draw do
  apipie
  root 'apipie/apipies#index'

  resources :users, only: :create do
    collection do
      post :login
    end
  end
  resources :categories, only: :index
  resources :expenses_types, only: :index

end
