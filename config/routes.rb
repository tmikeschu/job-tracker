Rails.application.routes.draw do

  resources :companies, except: [:patch] do
    resources :jobs, except: [:patch]
  end

  resources :categories, except: [:patch]
end
