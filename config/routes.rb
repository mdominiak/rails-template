# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "home#index"
end
