Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:new, :create, :edit, :update, :index] do
    resources :messages, only: [:index, :delete, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "groups#index"
end
