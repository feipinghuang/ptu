Rails.application.routes.draw do
  resources :templates
  resources :actors, only: [:create, :show]
  resources :mergings, only: [:create, :show]
end
