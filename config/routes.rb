Rails.application.routes.draw do
  root to: "companies#index"

  resources :companies, except: [:patch] do
    resources :jobs, except: [:patch]
  end

  resources :categories, except: [:patch]
end
