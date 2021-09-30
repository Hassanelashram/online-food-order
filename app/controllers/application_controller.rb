class ApplicationController < ActionController::Base

    def current_order
        order = Order.find_by(id: session[:order_id])
        return Order.new unless order

        order
    end
end
