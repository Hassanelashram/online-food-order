class Dish < ApplicationRecord
    ALLOWED_CATEGORIES = [
        BURRITOS = "burritos",
        BOWLS = "bowls",
        STARTERS = "starters"
    ]

    # validations
    validates :name, :price, :category, presence: true

    # associations
    has_many :dish_items
    has_many :ingredients, through: :dish_items
    accepts_nested_attributes_for :ingredients
end
