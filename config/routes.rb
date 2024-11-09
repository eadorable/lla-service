Rails.application.routes.draw do
  devise_for :users
  resources :devices do
    resources :records
  end
  #root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "devices#index"
end
