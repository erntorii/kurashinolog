Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    delete 'users/destroy_image', to: 'users/registrations#destroy_image'
  end
  root 'logs#index'
  get 'about', to: 'logs#about'
  resources :users, only: [:show]
end
