class Category < ApplicationRecord
  has_many :products
  validates :description, presence: true
  validates :description, length: { minimum: 3 }
  validates :description, uniqueness: true
end
