Rails.application.routes.draw do
  namespace :api do
    resources :log_histories
    resources :contacts, only: [:index, :show, :create, :update, :destroy]
  end
end
