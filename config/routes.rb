Rails.application.routes.draw do
  root "pages#index"

  resources :pages, path: '',  param: :sublink do
    resources :subpages, path: '', param: :sublink do
      resources :subsubpages, path: '', param: :sublink
    end
  end
end
