Rails.application.routes.draw do
  resources :honors
  resources :clubs
  resources :members
  resources :categories
  resources :units

  root :to => "members#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
