Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :films do
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :lists, except: [:destroy] do
    resources :bookmarks, only: [:create]
  end
root 'films#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
