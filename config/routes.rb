Rails.application.routes.draw do
  devise_for :users
  #root to: "home#index"
  root to: "posts#index"
  
  resources :posts, only: [:index, :new, :create]

end
