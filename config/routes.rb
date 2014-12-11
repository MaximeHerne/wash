Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "pages#home"

  resources :orders do
    resources :review , only: [:show, :edit, :update, :new, :create]
  end
  resources :profiles, only: [:show, :edit, :update, :new, :create]

end