Rails.application.routes.draw do
  get 'twilio/voice'
  resources :profiles
  root 'pages#landingpage'
  post 'twilio/voice', to: 'twilio#voice'
  get 'pages/home'
  get 'pages/cgu'
  get 'pages/about'
  get 'pages/howto'
  resources :items
  resources :profiles, only: %i[show edit update]
  post 'items/:id/interest', to: 'items#interest', as: 'interest'
  
  resources :items
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
