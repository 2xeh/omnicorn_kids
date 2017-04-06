class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  # validates :qty, presence: true
  # validates :qty, numericality: true

  # some callback validations
  # validate :product_present
  # validate :order_present

  # AA NOTE: I don't know why this is a problem.... for seeding
  before_save :finalize

  # { message: "%{value} seems wrong" }

  # getter method for active admin support
  def name
    # ideally I wanted to show the product name ...
    # maybe with some other qualification
    #Product.find_by id: :product_id
    product.name
  end

  def price
    if persisted?
      self[:price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def product_present
    return unless product.nil?
    errors.add(:product, 'is not valid or is not active.')
  end

  def order_present
    return unless order.nil?
    errors.add(:order, 'is not a valid order.')
  end

  def finalize
    self[:price] = price
    # note: choosing to skip this. we can probably calculate
    # self[:total_price] = qty * self[:price]
  end
end
