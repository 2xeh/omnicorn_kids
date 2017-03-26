class Order < ApplicationRecord
  has_one :address
  has_one :customer

  # note: it is worth considering that a user might use multiple payments for an order. Like a gift certificate or two credit cards
  has_many :payments
  has_many :order_items
end
