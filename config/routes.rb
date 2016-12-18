Rails.application.routes.draw do
  root to: "companies#index"

  resources :companies, except: [:patch] do
    resources :jobs, except: [:patch]
    resources :contacts, only: [:create, :index]
  end

  resources :categories, except: [:patch]

  resources :jobs, only: [] do
    resource :comments, only: [:create]
  end
end
