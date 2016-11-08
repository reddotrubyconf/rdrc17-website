Rails.application.routes.draw do
  root "my/papers#new"

  namespace :my do
    resources :papers, only: [:new, :create, :show]
  end

  scope :auth do
    resource :github, only: :none do
      get    :callback, to: "sessions#create"
      get    :new,                              as: "sign_in"
      delete :destroy,  to: "sessions#destroy", as: "sign_out"
    end
  end
end
