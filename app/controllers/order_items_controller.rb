class OrderItemsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def change_status
        item = OrderItem.find(params['id']).update(status_id: params['status'])
        render json: item
    end
end