Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :links, only: %i[create show]
    resources :visits, only: :index
  end

  match '/:short_code', to: 'api/links#show', via: :get
  root to: 'react#app'
end
