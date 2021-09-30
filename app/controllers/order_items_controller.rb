class OrderItemsController < ApplicationController
    before_action :set_order_item, only: [:update, :destroy]
    def index

    end

    def create
        order_item = current_order.order_items.find_or_initialize_by(dish_id: params[:dish_id].to_i)
        order_item.quantity += 1 if order_item.persisted?
        order_item.save
        redirect_to dishes_url(category: "burritos")
    end

    def update
        @order_item.quantity += params[:quantity].to_i
        @order_item.destroy if @order_item.quantity.zero?
            
        if @order_item.save
            redirect_to dishes_url(category: "burritos")
        end
    end

    def destroy
        @order_item.destroy
        redirect_to dishes_url(category: "burritos")
    end

    private

    def order_item_params
        params.require(:order_item).permit(:quantity)
    end

    def set_order_item
        @order_item = OrderItem.find(params[:id])
    end
end
