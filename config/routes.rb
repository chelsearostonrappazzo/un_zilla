Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"
  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"

    post "/sessions" => "sessions#create"

    post "/photos" => "photos#create"
    post "/members" => "members#create"
    delete "/members/:id" => "members#destroy"
    get "/members" => "members#index"
    get "/moodboards" => "moodboards#index"
    get "/photos" => "photos#search"
    get "/gallery" => "photos#index"
    get "/cabals" => "cabals#index"
    get "/cabals/:id" => "cabals#show"
    post "/cabals" => "cabals#create"
    patch "/cabals/:id" => "cabals#update"

    get "/celebrations" => "celebrations#index"
    get "/celebrations/:id" => "celebrations#show"
    post "/celebrations" => "celebrations#create"
    patch "/celebrations/:id" => "celebrations#update"
    delete "/celebrations/:id" => "celebrations#destroy"
  end
end
