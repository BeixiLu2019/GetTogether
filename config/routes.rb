Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :users, only: :show

  resources :activities do
    resources :search, only: [:index]
    resources :bookings, only: [:create, :new]
    resources :conversations, only: [:create]
  end

  resources :bookings, only: [:destroy, :show] do
    resources :reviews, only: [:create, :new]
  end
  resources :reviews, only: [:destroy, :show, :edit, :update]


  resources :conversations, only: [:index, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :messages, only: [:destroy]


end
