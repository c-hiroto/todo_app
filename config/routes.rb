Rails.application.routes.draw do
  root    "static_pages#home"
  get     "/about",   to: "static_pages#about"
  get     "/contact", to: "static_pages#contact"
  get     "/signup",  to: "users#new"
  get     "/login",   to: "sessions#new"
  post    "/login",   to: "sessions#create"
  delete  "/logout",  to: "sessions#destroy"
  resources :users
  resources :tasks, only: [:create, :destroy]
  post "/tasks/:id/done", to: "tasks#done", as: 'done'
  post "/tasks/:id/undone", to: "tasks#undone", as: 'undone'
end