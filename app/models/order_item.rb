class OrderItem < ApplicationRecord
  belongs_to :order # RichOnRails
  belongs_to :product # RichOnRails

  # RichOnRails
  validates :qty, presence: true, numericality:
            { only_integer: true, greater_than: 0 }
  #
  # # some callback validations
  # validate :product_present # RichOnRails
  # validate :order_present # RichOnRails
  # before_save :finalize # RichOnRails

  # { message: "%{value} seems wrong" }


  # getter method for active admin support
  def name
    product.name
  end

  # Price of persisted order item or product price
  def price
    if persisted?
      self[:price]
    else
      product.price
    end
  end

  # to calculate the total_price
  def total_price
    price * qty
  end

  private

  # # RichOnRails
  # def product_present
  #   return unless product.nil?
  #   errors.add(:product, 'is not valid or is not active.')
  # end

  # # RichOnRails
  # def order_present
  #   return unless order.nil?
  #   errors.add(:order, 'is not a valid order.')
  # end

  # # RichOnRails
  # def finalize
  #   self[:price] = price
  #   # note: choosing to skip this. we can probably calculate
  #   # self[:total_price] = qty * self[:price]
  # end
end
