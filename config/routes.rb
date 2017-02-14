Rails.application.routes.draw do
  devise_for :users
  resources :groups, except: %i( delete ) do
    resources :messages, only: %i( index create )
  end
  root "groups#index"
end
