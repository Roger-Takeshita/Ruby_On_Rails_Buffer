Rails.application.routes.draw do
  # GEt /about
  # get 'about', to: 'about#index'
  get 'about-us', to: 'about#index', as: :about

  root to: 'main#index'
end
