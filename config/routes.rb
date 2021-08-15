Rails.application.routes.draw do
  root to: 'books#index'

  devise_for :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show]

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

end
