Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :activities do
    resources :search, only: [:index]
    resources :bookings, only: [:create, :new]
  end

  resources :bookings, only: [:destroy, :show]
  resources :users, only: :show

  resources :conversations, only: [:index, :show, :create, :destroy] do
    resources :messages, only: [:index, :new, :create]
  end
  resources :messages, only: [:destroy]
end
