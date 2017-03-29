class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :price, :qty, :order_id, :product_id, presence: true
  validates :price, :qty, numericality: true
  # { message: "%{value} seems wrong" }

  # getter method for active admin support
  def name
    # ideally I wanted to show the product name ...
    # maybe with some other qualification
    Product.find_by id: :product_id
  end
end
