Rails.application.routes.draw do
  devise_for :users

  resources :records
  #root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "records#index"
end
