class OrderStatus < ApplicationRecord
  # AA NOTE: these weren't in the tutorial
  validates :description, presence: true
  validates :description, length: { minimum: 3 }

  # RichOnRails
  has_many :orders

  # getter method for active admin support
  def name
    description
  end
end
