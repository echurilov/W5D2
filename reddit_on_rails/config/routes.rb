Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :subs do 
    resources :tops, except: [:destroy]
  end
  resources :tops, only: [:destroy] do
    resources :comments, except: [:destroy]
  end
  resources :comments, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
