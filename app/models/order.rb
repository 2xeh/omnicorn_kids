class Order < ApplicationRecord
  belongs_to :address, :customer

  # note: it is worth considering that a user might use multiple payments for an order. Like a gift certificate or two credit cards
  has_many :payments, :order_items
end
