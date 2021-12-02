Rails.application.routes.draw do
  root "pages#index"
  
  get "/add", to: "pages#add"
  resources :pages, path: "",  param: :sublink
end
