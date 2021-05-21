Rails.application.routes.draw do
  resources :vaccine_applications
  resources :vaccines
  resources :children
  resources :nurses
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
