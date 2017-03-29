class Payment < ApplicationRecord
  belongs_to :address
  belongs_to :order

  validates :payment_type, :amount, presence: true
  validates :amount, numericality: true
  # still considering the best implementation of this.
  # min length of 2 means that MC could be entered (mastercard)
  validates :payment_type, length: { minimum: 2 }

  # getter method for active admin support
  def name
    "#{payment_type}, $#{amount}"
  end
end
