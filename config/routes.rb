Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  root 'sessions#new'
  resources :posts do
    collection do
      post :confirm
    end
  end
end
