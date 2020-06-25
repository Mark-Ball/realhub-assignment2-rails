Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/orders', to: 'orders#index'
  get '/artwork/url/:id', to: 'artworks#url'
  get '/statuses', to: 'statuses#index'

  post '/order_items/:id/change_status', to: 'order_items#change_status'
end