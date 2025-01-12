Rails.application.routes.draw do
  resources :lists
  resources :tasks do
    member do
      patch :toggle_done
    end
  end

  root "lists#index"
end
