Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy]
  end

  resources :posts, only: %i[show new create edit update destroy] do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
