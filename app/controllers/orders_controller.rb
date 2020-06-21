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
        order = Order.find(params[:id])
        current_status = order.status_id
        if current_status == 2
            order.update(status_id: 1)
        else
            current_status += 1
            order.update(status_id: current_status)
        end
        render json: order.status.title
    end
end