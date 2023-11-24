Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i[index show]
  resources :posts, only: %i[index show new create destroy]

  get 'up' => 'rails/health#show', as: :rails_health_check
end
