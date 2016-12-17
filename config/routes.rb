Rails.application.routes.draw do
  root to: "dashboard#index"

  resources :companies, except: [:patch] do
    resources :jobs, except: [:patch]
  end

  resources :categories, except: [:patch]
end
