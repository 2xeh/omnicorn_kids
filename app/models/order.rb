class Order < ApplicationRecord
  belongs_to :address
  belongs_to :customer
  belongs_to :order_status

  # # a couple of callbacks
  # before_create :set_order_status
  # before_save :update_subtotal

  # note: it is worth considering that a user might use
  # multiple payments for an order. Like a gift certificate or two credit cards
  has_many :payments
  has_many :order_items

  # validations
  # validates :status, :pst, :gst, :hst, :address_id,
  #           :customer_id, :order_status_id, presence: true
  # consideration: total price would be calculated based on order items
  # the amount on the payment would be recorded on the payments table
  # validates :pst, :gst, :hst, numericality: true

  # getter method for active admin support
  def name
    customer_name = (Customer.find_by id: customer_id).name
    "#{customer_name}, #{updated_at}"
  end

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.qty * oi.price) : 0 }.sum
  end

  def status
    # o = OrderStatus.find_by(id: order_status_id)
    # o.description
    order_status_id
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
