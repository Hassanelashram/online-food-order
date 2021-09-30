class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :dish


  before_save :calculate_total

  def calculate_total
    self.total = dish.price * quantity
  end
end
