Rails.application.routes.draw do
  root "home#index"

  post "/generate_token", to: "home#generate_token"

  get "/find_duplicates", to: "home#find_duplicates"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
