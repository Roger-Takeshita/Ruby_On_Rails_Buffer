Rails.application.routes.draw do
  # GEt /about
  get 'about', to: 'about#index'

  root to: 'main#index'
end
