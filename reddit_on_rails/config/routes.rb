Rails.application.routes.draw do
  resources :posts, except: [:index]
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :subs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
