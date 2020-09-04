Rails.application.routes.draw do
  root 'logs#index'
  get 'about', to: 'logs#about'
end
