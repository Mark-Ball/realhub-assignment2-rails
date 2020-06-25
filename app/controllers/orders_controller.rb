class OrdersController < ApplicationController
    def index
        response = Order.all.includes(:agency, :campaign, :order_items).map { |order|
            {
                id: order.id,
                agency: order.agency,
                campaign: order.campaign,
                items: order.order_items

            }
        }
        render json: response
    end
end