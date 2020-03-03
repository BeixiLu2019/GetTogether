Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :activities do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:destroy, :show]
  resources :users, only: :show
end
