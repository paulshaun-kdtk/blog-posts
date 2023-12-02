Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  root 'users#index'

  resources :users, only: [:create, :index, :show, :new, :edit, :update, :destroy] do
    resources :posts, only: %i[index show new create destroy]
  end

  resources :posts, only: %i[show new create edit update destroy] do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
