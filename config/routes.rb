Rails.application.routes.draw do
  root 'logs#index'
  get 'logs/about'
end
