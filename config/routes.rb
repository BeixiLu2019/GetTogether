Rails.application.routes.draw do

  mount ActionCable.server => "/cable"
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  get 'random', to: 'pages#random', as: :random

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


  resources :conversations, only: [:index, :show, :destroy] do
    resources :messages, only:  [:new, :create]
  end
  resources :messages, only: [:destroy]


end
