Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :activities do
    resources :search, only: [:index]
    resources :bookings, only: [:create, :new]
  end

  resources :bookings, only: [:destroy, :show] do
    resources :reviews, only: [:create, :new, :edit, :update]
  end

  resources :users, only: :show
  resources :reviews, only: [:destroy]
end
