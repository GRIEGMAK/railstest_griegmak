Rails.application.routes.draw do
  root "application#index"

  get "/articles", to: "articles#index"
  get "/posts", to: "posts#index"
end
