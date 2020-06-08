Rails.application.routes.draw do
  resources :airports 
  resources :flights
  get 'flights', to: "flights#index"
  root "flights#index"
end
