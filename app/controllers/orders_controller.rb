class OrdersController < ApplicationController
    def index
        response = Order.all.includes(:agency, :status, :campaign).map { |order|
            {
                id: order.id,
                agency: order.agency,
                status: order.status,
                campaign: order.campaign,
                title: order.title,
                quantity: order.quantity
            }
        }
        render json: response
    end

    def status
        puts params
        order = Order.find(params[:id]).update({status: 1})
    end
end