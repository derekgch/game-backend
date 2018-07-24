Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      resources :games, only: [:index, :show]
      resources :words, only: [:index, :show]
    end
  end

  resources :users, only: [:show, :create, :update]
  resources :sessions, only: [:create]
  resources :games, only: [:index, :create, :update]

end
