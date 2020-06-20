class OrdersController < ApplicationController
    def index
        render json: {message: 'this is orders controller index'}
    end
end