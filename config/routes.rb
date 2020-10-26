Rails.application.routes.draw do
  resources :petitions do
    post :signatures
  end

  root to: "petitions#index"

  devise_for :admin_users
end
