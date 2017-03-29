class Order < ApplicationRecord
  belongs_to :address
  belongs_to :customer
  belongs_to :order_status

  # note: it is worth considering that a user might use
  # multiple payments for an order. Like a gift certificate or two credit cards
  has_many :payments
  has_many :order_items

  # validations
  validates :status, :pst, :gst, :hst, :address_id,
            :customer_id, :order_status_id, presence: true
  # consideration: total price would be calculated based on order items
  # the amount on the payment would be recorded on the payments table
  validates :pst, :gst, :hst, numericality: true
end
