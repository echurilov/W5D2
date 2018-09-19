Rails.application.routes.draw do
  resources :posts, only: [:destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :subs do 
    resources :posts, except: [:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
