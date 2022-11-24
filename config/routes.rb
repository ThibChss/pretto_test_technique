Rails.application.routes.draw do
  root to: "credits#new"
  resources :credits, only: %i[create show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
