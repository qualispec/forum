Forum::Application.routes.draw do
  resources :users do
    resources :messages, only: [:new, :index]
  end
  resources :messages

  resources :sessions, only: [:new, :create, :destroy]

  resources :boards, only: [:index, :show]

  resources :posts
  resources :replies

  root to: "sessions#new"

  match 'signup' => "users#new"
  match 'login' => "sessions#new"
  match 'logout' => "sessions#destroy"
end
