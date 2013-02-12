Forum::Application.routes.draw do
  resources :users do
    resources :messages, only: [:new, :index]
  end
  resources :messages

  resources :sessions, only: [:new, :create, :destroy]

  resources :boards, only: [:index, :show] do
    resources :posts, only: [:new]
  end

  resources :posts do
    resources :replies, only: [:new]
  end
  resources :replies

  root to: "sessions#new"

  match 'signup' => "users#new"
  match 'login' => "sessions#new"
  match 'logout' => "sessions#destroy"
end
