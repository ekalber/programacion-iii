Rails.application.routes.draw do
  resources :deliveries
  resources :loans
  resources :people
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
