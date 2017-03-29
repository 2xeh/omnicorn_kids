class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :price, :qty, :order_id, :product_id, presence: true
  validates :price, :qty, numericality: true
  # { message: "%{value} seems wrong" }
end
