Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy]
  end
  
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
