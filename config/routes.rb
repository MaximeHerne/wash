Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "pages#home"

  resources :orders do
    resources :review , only: [:show, :edit, :update, :new, :create]
  end
  resources :profiles, only: [:show, :edit, :update, :new, :create]

  get "pages/faq", :as => 'faq_page'
  get "pages/contact", :as => 'contact_page'
  get "pages/cgu", :as => 'cgu_page'
  get  "/sitemap", to:"pages#sitemap"
end