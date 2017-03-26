class Address < ApplicationRecord
  # has_many :customers
  # has_many :orders
  # has_many :payments
  belongs_to :province
end
