Rails.application.routes.draw do
  root to: "dashboard#show"
  get '/dashboard', to: "dashboard#show"

  resources :companies, except: [:patch] do
    resources :jobs, except: [:patch]
    resources :contacts, only: [:create, :index]
  end

  resources :jobs, only: [:index]

  resources :categories, except: [:patch]

  resources :jobs, only: [] do
    resource :comments, only: [:create]
  end
end
