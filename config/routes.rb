Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :links,  only: :create
    resources :visits, only: :index
  end

  match '/:short_code', to: 'links#show', via: :get
  root to: 'react#app'
end
