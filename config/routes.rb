Rails.application.routes.draw do

  namespace :api do
    resources :contacts, only: [:index, :show, :create, :update, :destroy]
  end

  match "*unmatched_route", to: "application#route_options", via: [:options]
end
