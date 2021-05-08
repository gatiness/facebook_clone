Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :posts do
    collection do
      post :confirm
    end
  end
end
