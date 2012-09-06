Holla2::Application.routes.draw do
  resources :messages
  resources :channels
  resources :assets
  resources :app

  match "/assets/*:id" => "assets#show"

  get "login" => redirect("/auth/twitter")
  get "logout" => "authorize#destroy"

  match "/authorize" => redirect("/auth/twitter")
  match "/auth/twitter/callback" => "authorize#create"
  match "/auth/failure" => "authorize#failure"

  root :to => "app#index"
end
