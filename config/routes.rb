Rails.application.routes.draw do

  resources :companies do
    resources :jobs
  end

  resources :categories, only: [:index, :new, :create, :show] do
    resources :jobs, only: [:index]
  end   
end
