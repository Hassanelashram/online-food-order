class Order < ApplicationRecord
    has_many :order_items
    has_many :dishes, through: :order_items


    def total
        @total ||= dishes.sum(:total)
    end
end
