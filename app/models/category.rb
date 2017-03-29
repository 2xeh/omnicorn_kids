class Category < ApplicationRecord
  has_many :products
  validates :description, presence: true
  validates :description, length: { minimum: 3 }
  validates :description, uniqueness: true

  # getter method for active admin support
  def name
    description
  end
end
