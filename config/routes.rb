Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :posts
  resources :posts do
    collection do
      post :confirm
    end
  end
end
