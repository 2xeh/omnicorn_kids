class OrderItem < ApplicationRecord
  belongs_to :order, :product
end
