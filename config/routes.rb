Rails.application.routes.draw do
  resources :lists
  resources :tasks

  root "lists#index"
end
