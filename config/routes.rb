Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
  resources :posts do 
    resources :comments, only: [:create]
    resources :likes, only: [:create]
    member do
      post 'like'
    end
  end
end