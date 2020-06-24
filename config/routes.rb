Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/orders', to: 'orders#index', as: 'orders'
  get '/order/:id/status', to: 'orders#status', as: 'order_status'
  get '/artwork/url/:id', to: 'artworks#url'
end
