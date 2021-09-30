class OrdersController < ApplicationController

    def create
        order = Order.new(order_params)

        if order.save
            session[:order_id] = order.id
            redirect_to dishes_url(category: "burritos")
        else
            redirect_to root_url
        end
    end

    def update
        order = Order.find(params[:id])
        if order.update!(order_params)
            redirect_to dishes_url
        else
            redirect_to root_url
        end
    end

    private

    def order_params
        params.require(:order).permit(:pickup_time, :price, :customer_email, :customer_name, :status, :food_ready_at)
    end
end
