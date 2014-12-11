Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations", sessions: "users/sessions"  }
  root to: "pages#home"

  resources :order do
    resources :review , only: [:show, :edit, :update, :new, :create]
  end
  resources :profiles, only: [:show, :edit, :update, :new, :create]

end
