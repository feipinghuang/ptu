Rails.application.routes.draw do
  root to: redirect("/templates")
  resources :templates
  resources :actors, only: [:create, :show]
  resources :mergings, only: [:create, :show]
end
