Holla2::Application.routes.draw do
  resources :messages
  resources :channels
  resources :assets
  resources :app

  match "/assets/*:id" => "assets#show"

  match "/auth/twitter/callback" => "authorize#create"
  match "/auth/failure" => "authorize#failure"
  match "/logout" => "authorize#destroy", :as => :logout
  match "/authorize" => redirect("/auth/twitter")

  root :to => "app#index"
end
