class DishesController < ApplicationController

    def index
        @order = current_order
        @category = params[:category]
        @dishes = Dish.where(category: @category)
    end

    def create
        dish = Dish.new(
            name: "Custom Burrito",
            category: "burrots"
        )

        ingredient_ids = params[:dish][:dish_items][:ingredient_id]
        ingredients = Ingredient.where(id: ingredient_ids)
        dish.price = 6 + ingredients.sum(:extra_price)
        dish.save
        ingredient_ids.each do |ingredient_id|
            next if ingredient_id.empty?
            dish.dish_items.create!(
                ingredient_id: ingredient_id
            )
        end
        OrderItem.create!(dish: dish, order: current_order)

        redirect_to dishes_url(category: "burritos")
    end
end
