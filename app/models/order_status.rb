class OrderStatus < ApplicationRecord
  validates :description, presence: true
  validates :description, length: { minimum: 3 }

  # getter method for active admin support
  def name
    description
  end
end
